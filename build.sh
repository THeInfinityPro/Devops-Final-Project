#!/bin/bash

sudo docker build -t project3 .

sudo docker tag project3 jagadishhak/project3:latest

sudo docker push jagadishhak/project3:latest
