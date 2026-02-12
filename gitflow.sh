#!/bin/bash

SEP="--------------------------------------------------------------------------------------"


echo "$SEP"
echo "📌 Current Git Status:"
git status
echo "$SEP"

# Confirm Add (default: Yes)
read -p "Do you want to add all changes? (Y/n): " add_choice
add_choice=${add_choice:-y}

if [[ "$add_choice" =~ ^[Yy]$ ]]; then
    git add .
    echo "✅ Changes added."
else
    echo "❌ Skipping git add."
fi

echo "$SEP"
echo "📌 Current Git Status:"
git status
echo "$SEP"

echo "📜 Recent Commits:"
git log --oneline -5
echo "$SEP"

# Commit Message
read -p "Enter commit message: " commit_msg

if [[ -z "$commit_msg" ]]; then
    echo "⚠️ Commit message cannot be empty. Aborting."
    exit 1
fi

git commit -m "$commit_msg"

echo "$SEP"
echo "📌 Current Git Status:"
git status
echo "$SEP"

echo "📜 Recent Commits:"
git log --oneline -5
echo "$SEP"

# Confirm Push (default: Yes)
read -p "Do you want to push? (Y/n): " push_choice
push_choice=${push_choice:-y}

if [[ "$push_choice" =~ ^[Yy]$ ]]; then
    git push
    echo "🚀 Pushed to remote."
else
    echo "❌ Push skipped."
fi

echo "$SEP"
echo "📜 Updated Git Log:"
git log --oneline -5
echo "$SEP"
