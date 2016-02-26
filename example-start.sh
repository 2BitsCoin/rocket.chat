#!/bin/sh

ROOT_URL=http://your-domain.com:3000/
MONGO_URL=mongodb://localhost:27017/rocketchat
ADMIN_EMAIL=admin@example.com
ADMIN_PASS=admin_password
PORT=3000
LOG=chat_plus.log

node main.js 2>&1 >$LOG &
