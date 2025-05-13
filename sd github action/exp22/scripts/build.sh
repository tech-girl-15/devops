#!/bin/bash
echo "Starting build process..."
echo "Compiling code..."
sleep 1
echo "Build complete at $(date)"
echo "Rebuilding project - $(date)"



git init
git add .
git commit -m "Add GitHub Actions workflow"
git branch -M main
git remote add origin git https://github.com/Shraddhaathorbole/devops_6th_prac.git
git push -u origin main
