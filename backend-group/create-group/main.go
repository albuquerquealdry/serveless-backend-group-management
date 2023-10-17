package main

import (
	"context"
	"encoding/json"
	"os"
	"time"

	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/dynamodb"
	"golang.org/x/crypto/bcrypt"
)

type User struct {
	ID    string `json:"id"`
	Owner string `json:"owner"`
	Name  string `json:"name"`
	Total string `json:"total"`
}

const (
	MinCost     int = 4  // the minimum allowable cost as passed in to GenerateFromPassword
	MaxCost     int = 31 // the maximum allowable cost as passed in to GenerateFromPassword
	DefaultCost int = 10 // the cost that will actually be set if a cost below MinCost is passed into GenerateFromPassword
)

func registerUser(ctx context.Context, request events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
	var user User
	if err := json.Unmarshal([]byte(request.Body), &user); err != nil {
		return events.APIGatewayProxyResponse{
			StatusCode: 400,
			Body:       "Invalid request body",
		}, nil
	}

	sess := session.Must(session.NewSession())
	svc := dynamodb.New(sess)
	timestamp := time.Now()
	hashedName, err := bcrypt.GenerateFromPassword([]byte(user.Name), bcrypt.MinCost)
	if err != nil {
		return events.APIGatewayProxyResponse{
			StatusCode: 500,
			Body:       "Generate Code Erro",
		}, err
	}

	item := map[string]*dynamodb.AttributeValue{
		"id": {
			S: aws.String(string(hashedName)),
		},
		"name": {
			S: aws.String(user.Name),
		},
		"owner": {
			S: aws.String(user.Owner),
		},
		"total": {
			S: aws.String(user.Total),
		},
		"timestamp": {
			S: aws.String(timestamp.Format("20060102150405")),
		},
		"validation": {
			S: aws.String(timestamp.Format("20060102150405")),
		},
	}

	_, err = svc.PutItemWithContext(ctx, &dynamodb.PutItemInput{
		TableName: aws.String(os.Getenv("DYNAMODB_GROUP_TABLE")),
		Item:      item,
	})
	if err != nil {
		return events.APIGatewayProxyResponse{
			StatusCode: 500,
			Body:       "Error inserting group into DynamoDB",
		}, err
	}

	responseBody := map[string]string{"code": string(hashedName)}
	responseJSON, _ := json.Marshal(responseBody)

	return events.APIGatewayProxyResponse{
		StatusCode: 201,
		Body:       string(responseJSON),
	}, nil
}

func main() {
	lambda.Start(registerUser)
}
