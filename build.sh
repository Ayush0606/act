#!/bin/bash
# Build script for production deployment

echo "🏗️ Building Full Stack Application for Production..."

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Backend Build
echo -e "${YELLOW}📦 Building Backend...${NC}"
cd server
npm install --production
npm run build
if [ $? -eq 0 ]; then
  echo -e "${GREEN}✅ Backend built successfully${NC}"
else
  echo -e "${RED}❌ Backend build failed${NC}"
  exit 1
fi
cd ..

# Frontend Build
echo -e "${YELLOW}📦 Building Frontend...${NC}"
cd client
npm install --production
GENERATE_SOURCEMAP=false npm run build
if [ $? -eq 0 ]; then
  echo -e "${GREEN}✅ Frontend built successfully${NC}"
else
  echo -e "${RED}❌ Frontend build failed${NC}"
  exit 1
fi
cd ..

echo -e "${GREEN}🎉 Production build complete!${NC}"
echo ""
echo "Next steps:"
echo "1. Backend ready in: server/"
echo "2. Frontend ready in: client/build/"
echo "3. Deploy server to your backend platform"
echo "4. Deploy client/build to your static hosting"
