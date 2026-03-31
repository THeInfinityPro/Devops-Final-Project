#!/bin/bash

sudo docker pull jagadishhak/project3:latest

sudo docker run -itd -p "80:80" jagadishhak/project3:latest
