#!/bin/bash

# 🚀 Script สำหรับรันระบบ RentEase ด้วย Docker
# Author: RentEase Team
# Usage: ./run-system.sh

echo "🐳 เริ่มต้นระบบ RentEase ด้วย Docker..."

# ตรวจสอบว่า Docker ทำงานอยู่หรือไม่
if ! docker info > /dev/null 2>&1; then
    echo "❌ Docker ไม่ได้ทำงาน กรุณาเริ่มต้น Docker Desktop ก่อน"
    exit 1
fi

echo "✅ Docker พร้อมใช้งาน"

# ตรวจสอบไฟล์ .env
if [ ! -f "backend/.env" ]; then
    echo "❌ ไม่พบไฟล์ backend/.env กรุณาสร้างไฟล์ก่อน"
    echo "📝 ตัวอย่างไฟล์ .env:"
    echo ""
    echo "# Server Configuration"
    echo "PORT=3001"
    echo "NODE_ENV=development"
    echo ""
    echo "# Supabase Configuration"
    echo "SUPABASE_URL=https://your-project-id.supabase.co"
    echo "SUPABASE_KEY=your-supabase-service-role-or-anon-key"
    echo ""
    echo "# JWT Configuration"
    echo "JWT_SECRET=your-secret-key"
    echo "JWT_EXPIRES_IN=1d"
    echo ""
    echo "# Supabase Storage"
    echo "AVATAR_BUCKET_NAME=avatars"
    echo ""
    echo "# SMTP Email Configuration"
    echo "SMTP_HOST=smtp.gmail.com"
    echo "SMTP_PORT=587"
    echo "SMTP_SECURE=false"
    echo "SMTP_USER=your-email@example.com"
    echo "SMTP_PASS=your-email-password-or-app-password"
    echo "SMTP_FROM=your-email@example.com"
    exit 1
fi

if [ ! -f "frontend/.env.local" ]; then
    echo "❌ ไม่พบไฟล์ frontend/.env.local กรุณาสร้างไฟล์ก่อน"
    echo "📝 ตัวอย่างไฟล์ .env.local:"
    echo ""
    echo "# Backend API URL"
    echo "VITE_API_URL=http://localhost:3001/api"
    echo ""
    echo "# Supabase Configuration"
    echo "VITE_SUPABASE_URL=https://your-project-id.supabase.co"
    echo "VITE_SUPABASE_ANON_KEY=your-supabase-service-role-or-anon-key"
    echo ""
    echo "# Socket.IO"
    echo "VITE_SOCKET_URL=http://localhost:3001"
    exit 1
fi

echo "✅ ไฟล์ environment variables พร้อมใช้งาน"

# หยุด containers ที่ทำงานอยู่ (ถ้ามี)
echo "🛑 หยุด containers ที่ทำงานอยู่..."
docker-compose down

# Build images ใหม่
echo "🔨 Build Docker images..."
docker-compose build

# รันระบบ
echo "🚀 เริ่มต้นระบบ..."
docker-compose up -d

# รอให้ระบบเริ่มต้น
echo "⏳ รอให้ระบบเริ่มต้น..."
sleep 10

# ตรวจสอบสถานะ
echo "📊 ตรวจสอบสถานะ containers..."
docker-compose ps

# ตรวจสอบ logs
echo "📝 ตรวจสอบ logs..."
docker-compose logs --tail=20

echo ""
echo "🎉 ระบบ RentEase พร้อมใช้งาน!"
echo ""
echo "🌐 Frontend: http://localhost:5173"
echo "🔧 Backend: http://localhost:3001"
echo "📊 API Health: http://localhost:3001/api/health"
echo ""
echo "📋 คำสั่งที่ใช้บ่อย:"
echo "  ดู logs: docker-compose logs -f"
echo "  หยุดระบบ: docker-compose down"
echo "  รีสตาร์ท: docker-compose restart"
echo "  ดูสถานะ: docker-compose ps"
echo ""
echo "🔍 หากมีปัญหา ตรวจสอบ logs ด้วย: docker-compose logs -f"
