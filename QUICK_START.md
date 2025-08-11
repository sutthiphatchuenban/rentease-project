# 🚀 คู่มือการเริ่มต้นใช้งานระบบ RentEase อย่างรวดเร็ว

> **รันระบบ RentEase ทั้ง Frontend และ Backend ด้วย Docker ใน 5 นาที**  
> *ง่าย สะดวก และรวดเร็ว*

---

## ⚡ การเริ่มต้นใช้งานอย่างรวดเร็ว

### 📋 สิ่งที่ต้องมี
- ✅ Docker Desktop ติดตั้งแล้ว
- ✅ โปรเจค RentEase clone แล้ว
- ✅ ไฟล์ .env พร้อมใช้งาน

---

## 🎯 ขั้นตอนการใช้งาน

### 1️⃣ **สร้างไฟล์ Environment Variables**

#### Backend (.env)
สร้างไฟล์ `backend/.env`:
```env
# Server Configuration
PORT=3001
NODE_ENV=development

# Supabase Configuration
SUPABASE_URL=https://your-project-id.supabase.co
SUPABASE_KEY=your-supabase-service-role-or-anon-key

# JWT Configuration
JWT_SECRET=your-secret-key
JWT_EXPIRES_IN=1d

# Supabase Storage
AVATAR_BUCKET_NAME=avatars

# SMTP Email Configuration
SMTP_HOST=smtp.gmail.com
SMTP_PORT=587
SMTP_SECURE=false
SMTP_USER=your-email@example.com
SMTP_PASS=your-email-password-or-app-password
SMTP_FROM=your-email@example.com
```

#### Frontend (.env.local)
สร้างไฟล์ `frontend/.env.local`:
```env
# Backend API URL
VITE_API_URL=http://localhost:3001/api

# Supabase Configuration
VITE_SUPABASE_URL=https://your-project-id.supabase.co
VITE_SUPABASE_ANON_KEY=your-supabase-service-role-or-anon-key

# Socket.IO
VITE_SOCKET_URL=http://localhost:3001
```

### 2️⃣ **รันระบบด้วย Docker**

#### ใช้ Script (แนะนำ)
```bash
# Linux/macOS
./run-system.sh

# Windows
run-system.bat
```

#### ใช้คำสั่ง Docker โดยตรง
```bash
# รันระบบทั้งหมด
docker-compose up -d

# ตรวจสอบสถานะ
docker-compose ps
```

### 3️⃣ **เข้าถึงระบบ**

- 🌐 **Frontend:** http://localhost:5173
- 🔧 **Backend:** http://localhost:3001
- 📊 **API Health:** http://localhost:3001/api/health

---

## 🛠️ คำสั่งที่ใช้บ่อย

### 🚀 การจัดการระบบ
```bash
# รันระบบ
docker-compose up -d

# หยุดระบบ
docker-compose down

# รีสตาร์ท
docker-compose restart

# ดูสถานะ
docker-compose ps
```

### 📝 การดู Logs
```bash
# ดู logs ทั้งหมด
docker-compose logs

# ดู logs แบบ real-time
docker-compose logs -f

# ดู logs เฉพาะ service
docker-compose logs -f backend
docker-compose logs -f frontend
```

### 🔧 การแก้ไขปัญหา
```bash
# Rebuild containers
docker-compose down
docker-compose build --no-cache
docker-compose up -d

# ลบทุกอย่างและเริ่มใหม่
docker-compose down -v --rmi all
docker-compose up -d
```

---

## ❓ การแก้ไขปัญหาด่วน

### 🚨 ปัญหาที่พบบ่อย

#### 1. Port ถูกใช้งาน
```bash
# ตรวจสอบ port
netstat -ano | findstr :3001
netstat -ano | findstr :5173

# ฆ่า process
taskkill /PID <PID> /F
```

#### 2. Container ไม่ start
```bash
# ดู logs
docker-compose logs backend
docker-compose logs frontend

# เริ่มใหม่
docker-compose down
docker-compose up -d
```

#### 3. Environment Variables ไม่ถูกต้อง
```bash
# ตรวจสอบใน container
docker-compose exec backend env | grep SUPABASE
docker-compose exec frontend env | grep VITE
```

---

## 🎉 สรุป

หลังจากทำตามขั้นตอนทั้งหมด:

✅ **ระบบพร้อมใช้งานใน 5 นาที**  
✅ **Frontend:** http://localhost:5173  
✅ **Backend:** http://localhost:3001  
✅ **Docker containers ทำงานปกติ**  
✅ **พร้อมสำหรับการพัฒนาและทดสอบ**  

---

## 📚 ข้อมูลเพิ่มเติม

- 📖 **คู่มือเต็ม:** [INSTALLATION_GUIDE.md](INSTALLATION_GUIDE.md)
- 🐳 **คู่มือ Docker:** [DOCKER_SETUP.md](DOCKER_SETUP.md)
- 🔧 **การแก้ไขปัญหา:** ดูในคู่มือ Docker

---

<div align="center">

**🎯 ระบบพร้อมใช้งาน! 🚀**

*หากมีปัญหา ตรวจสอบ logs ด้วย: `docker-compose logs -f`*

</div>
