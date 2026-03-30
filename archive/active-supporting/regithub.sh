#!/bin/bash
#
Regithub workflow for syncrescendence-schema
# Run this AFTER creating the repo on GitHub

cd /Users/system/syncrescendence-schema

# Remove old remote
echo "Removing old GitHub remote..."
git remote remove origin 2>/dev/null || true

# Add new remote (syncrescendence organization)
echo "Adding new remote: syncrescendence/syncrescendence-schema..."
git remote add origin https://github.com/syncrescendence/syncrescendence-schema.git

# Push all branches and tags
echo "Pushing to new remote..."
git push -u origin --all
git push -u origin --tags

echo "✓ Done. Repository migrated to syncrescendence/syncrescendence-schema"
