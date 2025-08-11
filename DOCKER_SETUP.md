# 🐳 คู่มือการติดตั้งและใช้งาน Docker สำหรับระบบ RentEase

> **รันระบบ RentEase ทั้ง Frontend และ Backend ด้วย Docker**  
> *ง่าย สะดวก และรวดเร็ว*

---

## 📋 สารบัญ

- [🎯 ภาพรวม](#-ภาพรวม)
- [💻 ความต้องการของระบบ](#-ความต้องการของระบบ)
- [🚀 การติดตั้ง Docker](#-การติดตั้ง-docker)
- [🔧 การตั้งค่า Environment Variables](#-การตั้งค่า-environment-variables)
- [🐳 การรันระบบด้วย Docker](#-การรันระบบด้วย-docker)
- [🧪 การทดสอบระบบ](#-การทดสอบระบบ)
- [🔍 การตรวจสอบ Logs](#-การตรวจสอบ-logs)
- [❓ การแก้ไขปัญหา](#-การแก้ไขปัญหา)
- [🛠️ คำสั่ง Docker ที่ใช้บ่อย](#️-คำสั่ง-docker-ที่ใช้บ่อย)

---

## 🎯 ภาพรวม

ระบบ RentEase จะถูกรันใน Docker containers แยกกัน:
- **Backend Container** - API Server ที่ port 3001
- **Frontend Container** - React App ที่ port 5173
- **PostgreSQL Container** - ฐานข้อมูล (Optional)
- **Redis Container** - Cache (Optional)

---

## 💻 ความต้องการของระบบ

### 📋 ความต้องการขั้นต่ำ
- **OS:** Windows 10/11, macOS 10.15+, Ubuntu 18.04+
- **RAM:** 8GB (แนะนำ 16GB)
- **Storage:** 10GB free space
- **Docker:** เวอร์ชัน 20.10+
- **Docker Compose:** เวอร์ชัน 2.0+

---

## 🚀 การติดตั้ง Docker

### 📥 1. ติดตั้ง Docker Desktop

#### Windows/macOS:
1. ไปที่ [docker.com](https://www.docker.com/products/docker-desktop/)
2. ดาวน์โหลด Docker Desktop
3. ติดตั้งและรีสตาร์ทเครื่อง
4. ตรวจสอบการติดตั้ง:
   ```bash
   docker --version
   docker-compose --version
   ```

#### Ubuntu:
```bash
# Update package index
sudo apt update

# Install prerequisites
sudo apt install apt-transport-https ca-certificates curl gnupg lsb-release

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add Docker repository
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Start Docker service
sudo systemctl start docker
sudo systemctl enable docker

# Add user to docker group
sudo usermod -aG docker $USER

# Logout and login again, then test
docker --version
```

---

## 🔧 การตั้งค่า Environment Variables

### 📁 1. Backend Environment (.env)

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

### 📁 2. Frontend Environment (.env.local)

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

---

## 🐳 การรันระบบด้วย Docker

### 🚀 1. รันระบบทั้งหมด

```bash
# รันระบบทั้งหมด (Backend + Frontend + Database)
docker-compose up -d

# ตรวจสอบสถานะ containers
docker-compose ps
```

### 🔧 2. รันเฉพาะ Backend และ Frontend

```bash
# รันเฉพาะ Backend และ Frontend (ไม่รวม Database)
docker-compose up -d backend frontend

# ตรวจสอบสถานะ
docker-compose ps
```

### 📊 3. ตรวจสอบ Logs

```bash
# ดู logs ทั้งหมด
docker-compose logs

# ดู logs เฉพาะ service
docker-compose logs backend
docker-compose logs frontend

# ดู logs แบบ real-time
docker-compose logs -f backend
docker-compose logs -f frontend
```

---

## 🧪 การทดสอบระบบ

### 🔍 1. ทดสอบ Backend

```bash
# ตรวจสอบ Backend API
curl http://localhost:3001/api/health

# ตรวจสอบ Provinces
curl http://localhost:3001/api/provinces

# ตรวจสอบ Categories
curl http://localhost:3001/api/categories
```

### 🌐 2. ทดสอบ Frontend

1. เปิดเบราว์เซอร์ไปที่ `http://localhost:5173`
2. ตรวจสอบว่าหน้าเว็บโหลดได้
3. ทดสอบการสมัครสมาชิก
4. ทดสอบการล็อกอิน

### 📱 3. ทดสอบฟีเจอร์หลัก

- ✅ การสมัครสมาชิก
- ✅ การล็อกอิน
- ✅ การดูรายการสินค้า
- ✅ การค้นหาสินค้า
- ✅ การเพิ่มสินค้า (สำหรับ owner)
- ✅ การสร้างการเช่า
- ✅ ระบบแชท

---

## 🔍 การตรวจสอบ Logs

### 📊 1. ตรวจสอบ Container Status

```bash
# ดูสถานะ containers ทั้งหมด
docker-compose ps

# ดูรายละเอียด containers
docker-compose ps -a
```

### 📝 2. ตรวจสอบ Logs

```bash
# ดู logs ทั้งหมด
docker-compose logs

# ดู logs เฉพาะ service
docker-compose logs backend
docker-compose logs frontend

# ดู logs แบบ real-time
docker-compose logs -f

# ดู logs แบบ real-time เฉพาะ service
docker-compose logs -f backend
docker-compose logs -f frontend
```

### 🔧 3. เข้าไปใน Container

```bash
# เข้าไปใน Backend container
docker-compose exec backend sh

# เข้าไปใน Frontend container
docker-compose exec frontend sh

# ตรวจสอบไฟล์ใน container
docker-compose exec backend ls -la
docker-compose exec frontend ls -la
```

---

## ❓ การแก้ไขปัญหา

### 🚨 ปัญหาที่พบบ่อย

#### 1. Port ถูกใช้งาน
```bash
# ตรวจสอบ port ที่ใช้งาน
netstat -ano | findstr :3001
netstat -ano | findstr :5173

# หรือใช้ Docker
docker port rentease-backend
docker port rentease-frontend
```

#### 2. Container ไม่สามารถ start ได้
```bash
# ตรวจสอบ logs
docker-compose logs backend
docker-compose logs frontend

# ตรวจสอบสถานะ
docker-compose ps -a

# ลบ containers และสร้างใหม่
docker-compose down
docker-compose up -d
```

#### 3. Environment Variables ไม่ถูกต้อง
```bash
# ตรวจสอบ environment variables ใน container
docker-compose exec backend env | grep SUPABASE
docker-compose exec frontend env | grep VITE

# ตรวจสอบไฟล์ .env
cat backend/.env
cat frontend/.env.local
```

#### 4. Dependencies ไม่ถูกต้อง
```bash
# Rebuild containers
docker-compose down
docker-compose build --no-cache
docker-compose up -d
```

#### 5. Volume Mounting Issues
```bash
# ตรวจสอบ volumes
docker volume ls

# ลบ volumes และสร้างใหม่
docker-compose down -v
docker-compose up -d
```

---

## 🛠️ คำสั่ง Docker ที่ใช้บ่อย

### 🚀 การจัดการ Containers

```bash
# รันระบบ
docker-compose up -d

# หยุดระบบ
docker-compose down

# รีสตาร์ทระบบ
docker-compose restart

# รีสตาร์ทเฉพาะ service
docker-compose restart backend
docker-compose restart frontend
```

### 🔧 การจัดการ Images

```bash
# Build images ใหม่
docker-compose build

# Build images ใหม่โดยไม่ใช้ cache
docker-compose build --no-cache

# Build เฉพาะ service
docker-compose build backend
docker-compose build frontend
```

### 📊 การตรวจสอบระบบ

```bash
# ดูสถานะ containers
docker-compose ps

# ดู logs
docker-compose logs

# ดู logs แบบ real-time
docker-compose logs -f

# ดู logs เฉพาะ service
docker-compose logs -f backend
docker-compose logs -f frontend
```

### 🧹 การทำความสะอาด

```bash
# หยุดและลบ containers
docker-compose down

# หยุดและลบ containers + volumes
docker-compose down -v

# ลบ images
docker-compose down --rmi all

# ลบทุกอย่าง
docker-compose down --rmi all -v
```

### 🔍 การ Debug

```bash
# เข้าไปใน container
docker-compose exec backend sh
docker-compose exec frontend sh

# ตรวจสอบ network
docker network ls
docker network inspect fixdeploy2_rentease-network

# ตรวจสอบ volumes
docker volume ls
docker volume inspect fixdeploy2_postgres_data
```

---

## 📱 การใช้งาน

### 🚀 1. การเริ่มต้นระบบ

```bash
# รันระบบทั้งหมด
docker-compose up -d

# ตรวจสอบสถานะ
docker-compose ps
```

### 🔧 2. การเข้าถึงระบบ

- **Backend API:** `http://localhost:3001`
- **Frontend Web App:** `http://localhost:5173`
- **API Health Check:** `http://localhost:3001/api/health`
- **Admin Login:** `http://localhost:5173/admin/login`

### 📊 3. การตรวจสอบ Logs

```bash
# ดู logs ทั้งหมด
docker-compose logs

# ดู logs แบบ real-time
docker-compose logs -f
```

---

## 🎉 สรุป

หลังจากทำตามขั้นตอนทั้งหมด คุณจะมีระบบ RentEase ที่ทำงานใน Docker:

✅ **Backend Container** ที่ `http://localhost:3001`  
✅ **Frontend Container** ที่ `http://localhost:5173`  
✅ **Database Container** (Optional) ที่ `localhost:5432`  
✅ **Redis Container** (Optional) ที่ `localhost:6379`  
✅ **ระบบพร้อมใช้งาน** ด้วยคำสั่งเดียว `docker-compose up -d`  

### 🚀 คำสั่งหลักที่ใช้

```bash
# รันระบบ
docker-compose up -d

# หยุดระบบ
docker-compose down

# ดู logs
docker-compose logs -f

# รีสตาร์ท
docker-compose restart
```

ระบบพร้อมใช้งานสำหรับการพัฒนาและทดสอบด้วย Docker!

---

<div align="center">

**🐳 ระบบพร้อมใช้งานด้วย Docker! 🚀**

*หากมีคำถามหรือต้องการความช่วยเหลือเพิ่มเติม กรุณาติดต่อทีมพัฒนา*

</div>
