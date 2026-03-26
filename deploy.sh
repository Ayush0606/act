#!/bin/bash
# Deploy script for Linux/Mac

set -e

echo "🚀 Deploying Full Stack Application..."

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Check if .env.production exists
if [ ! -f "server/.env.production" ]; then
  echo -e "${RED}❌ server/.env.production not found${NC}"
  exit 1
fi

# Build
echo -e "${YELLOW}📦 Building application...${NC}"
bash build.sh

# Deploy Backend
echo -e "${YELLOW}🚀 Deploying Backend...${NC}"
read -p "Backend platform (heroku/railway/digitalocean): " backend_platform

case $backend_platform in
  heroku)
    echo "Deploying to Heroku..."
    cd server
    git push heroku main
    cd ..
    ;;
  railway)
    echo "Deploying to Railway..."
    railway up
    ;;
  *)
    echo "Skipping backend deployment"
    ;;
esac

# Deploy Frontend
echo -e "${YELLOW}🚀 Deploying Frontend...${NC}"
read -p "Frontend platform (vercel/netlify/s3): " frontend_platform

case $frontend_platform in
  vercel)
    echo "Deploying to Vercel..."
    cd client
    vercel --prod
    cd ..
    ;;
  netlify)
    echo "Deploying to Netlify..."
    cd client
    netlify deploy --prod --dir=build
    cd ..
    ;;
  s3)
    echo "Deploying to AWS S3..."
    cd client
    aws s3 sync build/ s3://your-bucket-name
    cd ..
    ;;
  *)
    echo "Skipping frontend deployment"
    ;;
esac

echo -e "${GREEN}✅ Deployment complete!${NC}"
