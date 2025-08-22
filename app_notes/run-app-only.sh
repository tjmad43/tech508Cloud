#!/bin/bash

echo "Set db IP..."
export DB_HOST=mongodb://172.31.22.31:27017/posts
echo "Done"
echo

echo "Find app folder..."
cd repo/app
echo "Done"
echo

echo "Stop any prev processes..."
pm2 stop all
echo "Done"
echo

echo "Start app..."
pm2 start app.js