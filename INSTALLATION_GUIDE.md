# 📋 คู่มือการติดตั้งระบบ RentEase ตั้งแต่เริ่มต้นเครื่องเปล่าๆ

> **ระบบแพลตฟอร์มเช่าสินค้าออนไลน์**  
> *Built with Node.js, React, TypeScript, Supabase*

---

## 📋 สารบัญ

- [🎯 ภาพรวมระบบ](#-ภาพรวมระบบ)
- [💻 ความต้องการของระบบ](#-ความต้องการของระบบ)
- [🚀 ขั้นตอนการติดตั้ง](#-ขั้นตอนการติดตั้ง)
- [🔧 การตั้งค่า Backend](#-การตั้งค่า-backend)
- [⚛️ การตั้งค่า Frontend](#️-การตั้งค่า-frontend)
- [🗄️ การตั้งค่าฐานข้อมูล](#️-การตั้งค่าฐานข้อมูล)
- [🔐 การตั้งค่าความปลอดภัย](#-การตั้งค่าความปลอดภัย)
- [🧪 การทดสอบระบบ](#-การทดสอบระบบ)
- [📱 การใช้งาน](#-การใช้งาน)
- [❓ การแก้ไขปัญหา](#-การแก้ไขปัญหา)

---

## 🎯 ภาพรวมระบบ

**RentEase** เป็นแพลตฟอร์มเช่าสินค้าออนไลน์ที่เชื่อมต่อระหว่างเจ้าของสินค้าและผู้เช่า

### ✨ คุณสมบัติหลัก
- 🔐 ระบบ Authentication & Authorization (JWT)
- 👥 จัดการผู้ใช้ (Registration, Profile, Verification)
- 🏷️ จัดการสินค้า (Categories, Products, Images)
- 📅 ระบบเช่า (Booking, Payment, Delivery)
- 💬 ระบบแชท (Real-time messaging)
- ⭐ ระบบรีวิว (Rating & Reviews)
- 🛡️ ระบบร้องเรียน (Complaints & Support)
- 📊 Admin Dashboard

---

## 💻 ความต้องการของระบบ

### 📋 ความต้องการขั้นต่ำ
- **OS:** Windows 10/11, macOS 10.15+, Ubuntu 18.04+
- **RAM:** 8GB (แนะนำ 16GB)
- **Storage:** 10GB free space
- **Internet:** การเชื่อมต่ออินเทอร์เน็ตที่เสถียร

### 🔧 Software ที่ต้องติดตั้ง
- **Node.js:** เวอร์ชัน 18.0.0 หรือใหม่กว่า
- **npm:** เวอร์ชัน 8.0.0 หรือใหม่กว่า
- **Git:** เวอร์ชัน 2.30.0 หรือใหม่กว่า
- **Code Editor:** VS Code (แนะนำ)

---

## 🚀 ขั้นตอนการติดตั้ง

### 📥 1. ดาวน์โหลดและติดตั้ง Software พื้นฐาน

#### 1.1 ติดตั้ง Node.js
1. ไปที่ [nodejs.org](https://nodejs.org/)
2. ดาวน์โหลด **LTS version**
3. รัน installer และติดตั้งตามขั้นตอน
4. ตรวจสอบการติดตั้ง:
   ```bash
   node --version
   npm --version
   ```

#### 1.2 ติดตั้ง Git
1. ไปที่ [git-scm.com](https://git-scm.com/)
2. ดาวน์โหลดเวอร์ชันล่าสุด
3. รัน installer และติดตั้งตามขั้นตอน
4. ตรวจสอบการติดตั้ง:
   ```bash
   git --version
   ```

### 📁 2. Clone โปรเจค

```bash
# สร้างโฟลเดอร์สำหรับโปรเจค
mkdir rentease-project
cd rentease-project

# Clone repository
git clone <repository-url>
cd fixDeploy2

# ตรวจสอบโครงสร้างไฟล์
ls -la
```

---

## 🔧 การตั้งค่า Backend

### 📂 1. เข้าไปในโฟลเดอร์ Backend

```bash
cd backend
```

### 📦 2. ติดตั้ง Dependencies

```bash
# ติดตั้ง dependencies ทั้งหมด
npm install

# ตรวจสอบว่าไม่มี error
npm list --depth=0
```

### 🔑 3. สร้าง Supabase Project

#### 3.1 สมัครและสร้างโปรเจค
1. ไปที่ [supabase.com](https://supabase.com/)
2. สมัครสมาชิกหรือเข้าสู่ระบบ
3. คลิก **"New Project"**
4. กรอกข้อมูลโปรเจค:
   - **Name:** RentEase
   - **Database Password:** สร้างรหัสผ่านที่แข็งแกร่ง
   - **Region:** เลือก region ที่ใกล้ที่สุด
5. คลิก **"Create new project"**
6. รอการสร้างโปรเจค (ประมาณ 2-3 นาที)

#### 3.2 เก็บข้อมูลสำคัญ
1. ไปที่ **Settings** > **API**
2. เก็บข้อมูลต่อไปนี้:
   - **Project URL** (เช่น: `https://abcdefghijklmnop.supabase.co`)
   - **anon public** (สำหรับ frontend)
   - **service_role** (สำหรับ backend - เก็บเป็นความลับ)

### 🌍 4. สร้างไฟล์ Environment Variables

สร้างไฟล์ `.env` ในโฟลเดอร์ `backend/`:

```env
# Server Configuration
PORT=3001
NODE_ENV=development

# Supabase Configuration
SUPABASE_URL=https://your-project-id.supabase.co
SUPABASE_KEY=your-service-role-key-here

# JWT Configuration
JWT_SECRET=your-very-long-random-secret-key-here
JWT_EXPIRES_IN=1d

# Supabase Storage
AVATAR_BUCKET_NAME=avatars
PRODUCT_IMAGES_BUCKET_NAME=product-images
ID_VERIFICATION_BUCKET_NAME=id-verification
PAYMENT_PROOFS_BUCKET_NAME=payment-proofs
CHAT_FILES_BUCKET_NAME=chat-files
SHIPPING_RECEIPTS_BUCKET_NAME=shipping-receipts
RETURN_CONDITION_IMAGES_BUCKET_NAME=return-condition-images
CLAIM_ATTACHMENTS_BUCKET_NAME=claim-attachments
COMPLAINT_ATTACHMENTS_BUCKET_NAME=complaint-attachments

# SMTP Email Configuration
SMTP_HOST=smtp.gmail.com
SMTP_PORT=587
SMTP_SECURE=false
SMTP_USER=your-email@gmail.com
SMTP_PASS=your-app-password-here
SMTP_FROM=your-email@gmail.com
```

### 🗄️ 5. Setup ฐานข้อมูลและ Storage

```bash
# รัน setup script ครบถ้วน
npm run setup

# หรือรันทีละขั้นตอน
npm run setup:buckets    # สร้าง storage buckets
npm run setup:schema     # สร้าง database schema
npm run setup:data       # เพิ่มข้อมูลเริ่มต้น
```

### 🚀 6. เริ่มต้น Backend Server

```bash
# Development mode (แนะนำสำหรับการพัฒนา)
npm run dev

# หรือ Production mode
npm start

# ตรวจสอบว่า server ทำงาน
curl http://localhost:3001/api/health
```

---

## ⚛️ การตั้งค่า Frontend

### 📂 1. เข้าไปในโฟลเดอร์ Frontend

```bash
# เปิด terminal ใหม่
cd ../frontend
```

### 📦 2. ติดตั้ง Dependencies

```bash
# ติดตั้ง dependencies ทั้งหมด
npm install

# ตรวจสอบว่าไม่มี error
npm list --depth=0
```

### 🌍 3. สร้างไฟล์ Environment Variables

สร้างไฟล์ `.env.local` ในโฟลเดอร์ `frontend/`:

```env
# Backend API URL
VITE_API_URL=http://localhost:3001/api

# Supabase Configuration
VITE_SUPABASE_URL=https://your-project-id.supabase.co
VITE_SUPABASE_ANON_KEY=your-anon-key-here

# Google OAuth (ถ้าต้องการ)
VITE_GOOGLE_CLIENT_ID=your-google-client-id

# AI Chat (ถ้าต้องการ)
VITE_OPENROUTER_API_KEY=your-openrouter-api-key

# Socket.IO
VITE_SOCKET_URL=http://localhost:3001
```

### 🚀 4. เริ่มต้น Frontend Development Server

```bash
# เริ่มต้น development server
npm run dev

# ตรวจสอบว่า frontend ทำงาน
# เปิดเบราว์เซอร์ไปที่ http://localhost:5173
```

---

## 🗄️ การตั้งค่าฐานข้อมูล

### 📊 1. ตรวจสอบ Database Schema

หลังจากรัน `npm run setup` ระบบจะสร้างตารางต่อไปนี้:

- **users** - ข้อมูลผู้ใช้
- **admin_users** - ผู้ดูแลระบบ
- **categories** - หมวดหมู่สินค้า
- **products** - สินค้า
- **product_images** - รูปภาพสินค้า
- **rentals** - การเช่า
- **rental_status_history** - ประวัติสถานะการเช่า
- **reviews** - รีวิว
- **chat_conversations** - บทสนทนา
- **chat_messages** - ข้อความ
- **complaints** - ร้องเรียน
- **notifications** - การแจ้งเตือน
- **payment_transactions** - ธุรกรรมการชำระเงิน
- **user_addresses** - ที่อยู่ผู้ใช้
- **wishlist** - รายการโปรด
- **system_settings** - การตั้งค่าระบบ
- **admin_logs** - ประวัติการกระทำของ admin
- **provinces** - จังหวัด

### 🔍 2. ตรวจสอบใน Supabase Dashboard

1. ไปที่ **Table Editor** ใน Supabase Dashboard
2. ตรวจสอบว่าตารางทั้งหมดถูกสร้างขึ้น
3. ตรวจสอบ **Storage** > **Buckets** ว่าถูกสร้างขึ้น

---

## 🔐 การตั้งค่าความปลอดภัย

### 🛡️ 1. JWT Secret

สร้าง JWT secret ที่แข็งแกร่ง:

```bash
# สร้าง random string 64 ตัวอักษร
node -e "console.log(require('crypto').randomBytes(32).toString('hex'))"
```

### 🔒 2. Environment Variables Security

- อย่า commit ไฟล์ `.env` เข้า Git
- ใช้ `.env.example` เป็น template
- เก็บ secrets ในที่ปลอดภัย

---

## 🧪 การทดสอบระบบ

### 🔍 1. ทดสอบ Backend API

```bash
# ตรวจสอบ server status
curl http://localhost:3001/api/health

# ตรวจสอบ provinces
curl http://localhost:3001/api/provinces

# ตรวจสอบ categories
curl http://localhost:3001/api/categories
```

### 🌐 2. ทดสอบ Frontend

1. เปิดเบราว์เซอร์ไปที่ `http://localhost:5173`
2. ตรวจสอบว่าหน้าเว็บโหลดได้
3. ทดสอบการสมัครสมาชิก
4. ทดสอบการล็อกอิน

---

## 📱 การใช้งาน

### 🚀 1. การเริ่มต้นระบบ

```bash
# Terminal 1: Backend
cd backend
npm run dev

# Terminal 2: Frontend
cd frontend
npm run dev
```

### 🔧 2. การจัดการระบบ

#### สำหรับ Developer:
- Backend: `http://localhost:3001`
- Frontend: `http://localhost:5173`
- API Docs: `http://localhost:3001/api/docs`

#### สำหรับ Admin:
- Admin Login: `http://localhost:5173/admin/login`
- Admin Dashboard: `http://localhost:5173/admin/dashboard`

---

## ❓ การแก้ไขปัญหา

### 🚨 ปัญหาที่พบบ่อย

#### 1. Port ถูกใช้งาน
```bash
# ตรวจสอบ port ที่ใช้งาน
netstat -ano | findstr :3001
netstat -ano | findstr :5173

# ฆ่า process ที่ใช้ port
taskkill /PID <PID> /F
```

#### 2. Dependencies ไม่ถูกต้อง
```bash
# ลบ node_modules และติดตั้งใหม่
rm -rf node_modules
npm install
```

#### 3. Environment Variables ไม่ถูกต้อง
```bash
# ตรวจสอบไฟล์ .env
cat .env

# ตรวจสอบใน code
console.log(process.env.SUPABASE_URL);
```

---

## 🎉 สรุป

หลังจากทำตามขั้นตอนทั้งหมด คุณจะมีระบบ RentEase ที่ทำงานได้ครบถ้วน:

✅ **Backend API** ที่ `http://localhost:3001`  
✅ **Frontend Web App** ที่ `http://localhost:5173`  
✅ **Database** ที่ Supabase  
✅ **Storage Buckets** สำหรับไฟล์  
✅ **Authentication System** ด้วย JWT  
✅ **Real-time Chat** ด้วย Socket.IO  
✅ **Admin Dashboard** สำหรับจัดการระบบ  

ระบบพร้อมใช้งานสำหรับการพัฒนาและทดสอบ!

---

<div align="center">

**🎯 ระบบพร้อมใช้งาน! 🚀**

*หากมีคำถามหรือต้องการความช่วยเหลือเพิ่มเติม กรุณาติดต่อทีมพัฒนา*

</div>
