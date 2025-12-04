# 🚀 Flux-AI-Pro 快速開始指南 v9.0.0

> **選項 A：純免費模式** - 100% 免費使用 Pollinations.ai，無需支付方式

---

## 📚 目錄

- [部署前準備](#部署前準備)
- [第一步：克隆倉庫](#第一步克隆倉庫)
- [第二步：更新 worker.js](#第二步更新-workerjs)
- [第三步：一鍵部署](#第三步一鍵部署)
- [第四步：驗證部署](#第四步驗證部署)
- [API 使用指南](#api-使用指南)
- [常見問題](#常見問題)

---

## 📦 部署前準備

### 1. **Node.js** (必須)
- 版本：v18 或更高
- 下載：[https://nodejs.org/](https://nodejs.org/)
- 驗證安裝：
  ```bash
  node -v
  # 應顯示 v18.x.x 或更高
  ```

### 2. **Cloudflare 賬戶** (免費)
- 註冊：[https://dash.cloudflare.com/sign-up](https://dash.cloudflare.com/sign-up)
- ✅ 完全免費，無需綁定支付方式
- ✅ 每天 100,000 次免費請求

### 3. **Git** (推薦)
- 用於克隆倉庫
- 下載：[https://git-scm.com/](https://git-scm.com/)
- 驗證安裝：
  ```bash
  git --version
  ```

---

## 🎯 第一步：克隆倉庫

### macOS / Linux

```bash
# 1. 克隆倉庫到本地
git clone https://github.com/kinai9661/Flux-AI-Pro.git

# 2. 進入項目目錄
cd Flux-AI-Pro

# 3. 查看文件列表（確認文件完整）
ls -la
```

### Windows

```cmd
REM 1. 克隆倉庫到本地
git clone https://github.com/kinai9661/Flux-AI-Pro.git

REM 2. 進入項目目錄
cd Flux-AI-Pro

REM 3. 查看文件列表（確認文件完整）
dir
```

### 如果沒有安裝 Git

1. 訪問 https://github.com/kinai9661/Flux-AI-Pro
2. 點擊綠色的 **Code** 按鈕
3. 選擇 **Download ZIP**
4. 解壓縮到你想要的目錄

---

## ⚠️ 第二步：更新 worker.js

**重要提示：** 倉庫中的 worker.js 可能不完整，需要手動替換！

### 方法 1：通過 GitHub 網頁編輯（推薦）

1. **訪問編輯頁面**：https://github.com/kinai9661/Flux-AI-Pro/edit/main/worker.js

2. **刪除所有現有內容**（Ctrl+A 然後 Delete）

3. **複製完整代碼**：
   - 在聊天記錄中找到「完整的 worker.js v9.0.0 代碼」
   - 複製所有代碼（約 2000 行）

4. **粘貼到編輯器**

5. **提交更改**：
   - Commit message: `fix: Update worker.js to v9.0.0 complete version`
   - 點擊 **Commit changes**

### 方法 2：本地替換

1. **創建新的 worker.js 文件**
   ```bash
   # 備份舊文件
   mv worker.js worker.js.backup
   
   # 創建新文件
   nano worker.js  # 或使用你喜歡的編輯器
   ```

2. **粘貼完整代碼**並保存

3. **提交到 GitHub**
   ```bash
   git add worker.js
   git commit -m "fix: Update worker.js to v9.0.0"
   git push origin main
   ```

### ✅ 驗證 worker.js 是否正確

檢查文件是否包含以下內容：

```bash
# 查看文件行數（應該約 2000 行）
wc -l worker.js

# 檢查關鍵字（應該都存在）
grep "PROJECT_VERSION" worker.js
grep "PollinationsProvider" worker.js
grep "CloudflareProvider" worker.js
grep "handleUI" worker.js
```

如果以上命令都有輸出，說明文件正確！

---

## ⚡ 第三步：一鍵部署

確保你在 `Flux-AI-Pro` 目錄下，然後執行部署腳本。

### macOS / Linux

```bash
# 1. 給予腳本執行權限
chmod +x deploy-free.sh

# 2. 執行一鍵部署
./deploy-free.sh
```

### Windows

```cmd
REM 雙擊運行或在命令提示符中執行
deploy-free.bat
```

### 部署過程中會發生什麼？

腳本會自動完成以下步驟：

```
[1/5] 🔍 檢查 Node.js...
      ✅ Node.js 版本: v18.x.x

[2/5] 🔍 檢查 Wrangler CLI...
      ⚠️  未檢測到 Wrangler，正在安裝...
      ✅ Wrangler 安裝完成

[3/5] 🔐 登錄 Cloudflare...
      ⏳ 即將打開瀏覽器進行授權...
      ✅ 登錄成功

[4/5] 🚀 部署到開發環境 (純免費模式)...
      ⏳ 正在部署...
      ✅ 部署完成

[5/5] 🌐 獲取訪問地址...
      ✅ Worker URL: https://flux-ai-pro.your-subdomain.workers.dev
```

### 部署成功後

你會看到類似這樣的輸出：

```
================================================================
🎉 部署成功！
================================================================

📍 訪問地址:
   https://flux-ai-pro.your-subdomain.workers.dev

🧪 測試接口:
   健康檢查: https://flux-ai-pro.your-subdomain.workers.dev/health
   模型列表: https://flux-ai-pro.your-subdomain.workers.dev/v1/models
   提供商信息: https://flux-ai-pro.your-subdomain.workers.dev/v1/providers

📖 功能說明:
   • 17 個 AI 模型完全免費
   • 自動高清優化 (Auto HD)
   • 智能參數優化
   • 12 種藝術風格
   • NSFW 內容支持
   • OpenAI 兼容 API

💡 提示:
   • 此為開發環境，僅使用免費 Pollinations.ai
   • 如需啟用 Cloudflare AI，請使用 deploy-premium.sh

================================================================
```

---

## ✅ 第四步：驗證部署

### 1. 訪問 Web 界面

在瀏覽器中打開你的 Worker URL：

```
https://your-worker.workers.dev
```

你應該看到完整的 AI 圖像生成界面。

### 2. 測試健康檢查

```bash
curl https://your-worker.workers.dev/health
```

**預期回應**：
```json
{
  "status": "ok",
  "version": "9.0.0",
  "providers": ["pollinations"],
  "cloudflare_ai_available": false,
  "timestamp": "2025-12-04T08:00:00.000Z"
}
```

### 3. 查看可用模型

```bash
curl https://your-worker.workers.dev/v1/models
```

**預期回應**：
```json
{
  "object": "list",
  "data": [
    {
      "id": "flux",
      "name": "Flux",
      "provider": "pollinations",
      "tier": "free"
    },
    ...
  ],
  "total": 17
}
```

### 4. 測試圖像生成

```bash
curl -X POST https://your-worker.workers.dev/v1/images/generations \
  -H "Content-Type: application/json" \
  -d '{
    "prompt": "a cute cat",
    "model": "flux",
    "width": 1024,
    "height": 1024
  }'
```

**預期回應**：
```json
{
  "created": 1733299200,
  "data": [
    {
      "url": "https://image.pollinations.ai/...",
      "provider": "Pollinations.ai",
      "model": "flux",
      "width": 1024,
      "height": 1024,
      "cost": "FREE"
    }
  ]
}
```

---

## 💻 API 使用指南

### 基本圖像生成

```bash
curl -X POST https://your-worker.workers.dev/v1/images/generations \
  -H "Content-Type: application/json" \
  -d '{
    "prompt": "a beautiful sunset over mountains",
    "model": "flux-realism",
    "width": 1024,
    "height": 1024,
    "n": 1,
    "auto_hd": true,
    "auto_optimize": true
  }'
```

### 使用風格預設

```bash
curl -X POST https://your-worker.workers.dev/v1/images/generations \
  -H "Content-Type: application/json" \
  -d '{
    "prompt": "a cute cat",
    "model": "flux-anime",
    "style": "anime",
    "width": 1024,
    "height": 1024
  }'
```

### 使用負面提示詞

```bash
curl -X POST https://your-worker.workers.dev/v1/images/generations \
  -H "Content-Type: application/json" \
  -d '{
    "prompt": "beautiful landscape",
    "negative_prompt": "ugly, blurry, low quality",
    "model": "flux-realism",
    "steps": 28,
    "guidance_scale": 7.5
  }'
```

### 批量生成（最多 4 張）

```bash
curl -X POST https://your-worker.workers.dev/v1/images/generations \
  -H "Content-Type: application/json" \
  -d '{
    "prompt": "fantasy castle",
    "model": "flux-pro",
    "n": 4,
    "width": 1024,
    "height": 1024
  }'
```

### OpenAI 兼容模式

```bash
curl -X POST https://your-worker.workers.dev/v1/chat/completions \
  -H "Content-Type: application/json" \
  -d '{
    "model": "flux-pro",
    "messages": [
      {"role": "user", "content": "畫一隻在太空的貓"}
    ]
  }'
```

### Python 示例

```python
import requests
import json

url = "https://your-worker.workers.dev/v1/images/generations"

payload = {
    "prompt": "a futuristic city at night",
    "model": "flux-realism",
    "width": 1024,
    "height": 1024,
    "auto_hd": True,
    "auto_optimize": True,
    "style": "cyberpunk"
}

response = requests.post(url, json=payload)
data = response.json()

if "data" in data and len(data["data"]) > 0:
    image_url = data["data"][0]["url"]
    print(f"Image URL: {image_url}")
    print(f"Cost: {data['data'][0]['cost']}")
else:
    print("Error:", data)
```

### JavaScript (Node.js) 示例

```javascript
const fetch = require('node-fetch');

async function generateImage() {
  const response = await fetch('https://your-worker.workers.dev/v1/images/generations', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({
      prompt: 'a dragon in the sky',
      model: 'flux-anime',
      width: 1024,
      height: 1024,
      auto_hd: true,
      style: 'anime'
    })
  });

  const data = await response.json();
  console.log('Image URL:', data.data[0].url);
  console.log('Model:', data.data[0].model);
  console.log('Cost:', data.data[0].cost);
}

generateImage();
```

### JavaScript (瀏覽器) 示例

```html
<!DOCTYPE html>
<html>
<head>
    <title>Flux AI 測試</title>
</head>
<body>
    <button onclick="generate()">生成圖片</button>
    <div id="result"></div>

    <script>
    async function generate() {
        const response = await fetch('https://your-worker.workers.dev/v1/images/generations', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({
                prompt: 'beautiful sunset',
                model: 'flux-realism',
                auto_hd: true
            })
        });
        
        const data = await response.json();
        const img = document.createElement('img');
        img.src = data.data[0].url;
        document.getElementById('result').appendChild(img);
    }
    </script>
</body>
</html>
```

---

## ❓ 常見問題

### Q1: 部署失敗，提示 "Authentication error"

**解決方法**：
```bash
# 清除舊的登錄信息
wrangler logout

# 重新登錄
wrangler login

# 重試部署
wrangler deploy --env dev
```

### Q2: worker.js 是 Base64 編碼的內容

**問題**：如果你看到文件內容是亂碼或 Base64，說明文件不完整。

**解決方法**：按照「第二步：更新 worker.js」的說明重新替換文件。

### Q3: 部署後訪問 Worker URL 顯示錯誤

**檢查清單**：

1. ✅ worker.js 是否完整（約 2000 行）
2. ✅ wrangler.toml 是否存在
3. ✅ 是否使用了 `--env dev` 參數

**重新部署**：
```bash
wrangler deploy --env dev
```

### Q4: 如何更新已部署的 Worker？

**方法 1：使用腳本**：
```bash
# 拉取最新代碼
git pull

# 重新執行部署腳本
./deploy-free.sh  # macOS/Linux
deploy-free.bat   # Windows
```

**方法 2：手動部署**：
```bash
# 拉取最新代碼
git pull

# 重新部署
wrangler deploy --env dev
```

### Q5: 生成的圖片在哪裡？

Pollinations.ai 返回的是 **圖片 URL**，不是 Base64。你可以：
- 直接在瀏覽器中打開 URL
- 下載圖片到本地
- 嵌入到你的網站/應用

**下載示例**：
```bash
# 獲取圖片 URL
IMAGE_URL="https://image.pollinations.ai/..."

# 下載到本地
curl -o output.png "$IMAGE_URL"
```

### Q6: 我可以使用多少次？

✅ **完全無限制！**
- Pollinations.ai 完全免費
- Cloudflare Workers 免費計劃每天 100,000 請求
- 無需信用卡
- 無使用限制

### Q7: 如何啟用 Cloudflare AI（付費功能）？

1. **確保有支付方式**：Cloudflare AI 需要綁定信用卡

2. **在 Dashboard 中啟用 AI**：
   - 訪問：https://dash.cloudflare.com/
   - Workers & Pages → 你的 Worker
   - Settings → Bindings → Add Binding
   - 選擇 "AI" 類型，名稱填 "AI"

3. **使用付費部署腳本**：
   ```bash
   ./deploy-premium.sh  # macOS/Linux
   deploy-premium.bat   # Windows
   ```

4. **或手動部署**：
   ```bash
   wrangler deploy --env production
   ```

### Q8: Worker URL 是什麼格式？

部署後，Cloudflare 會生成一個類似這樣的 URL：

```
https://flux-ai-pro.<你的子域>.workers.dev
```

你也可以在 Cloudflare Dashboard 中查看：
1. 點擊 **Workers & Pages**
2. 選擇 **flux-ai-pro**
3. 查看 **Preview** 或 **Custom Domains**

### Q9: 可以綁定自定義域名嗎？

✅ **可以！**

1. 在 Cloudflare Dashboard 中點擊 Worker
2. 選擇 **Settings** > **Domains & Routes**
3. 點擊 **Add Custom Domain**
4. 輸入你的域名（例如：`api.yourdomain.com`）
5. 按照提示配置 DNS

### Q10: 如何查看部署日誌？

```bash
# 實時查看日誌
wrangler tail --env dev

# 或在 Dashboard 中查看
# Workers & Pages > 你的 Worker > Logs
```

---

## 🎉 恭喜！部署完成

現在你已經成功部署了一個完全免費的 AI 圖像生成服務！

### 🔗 相關鏈接

- **GitHub 倉庫**: https://github.com/kinai9661/Flux-AI-Pro
- **完整文檔**: [README.md](README.md)
- **Cloudflare Dashboard**: https://dash.cloudflare.com/
- **Pollinations API**: https://pollinations.ai/

### 👍 下一步

1. ⭐ **Star 這個倉庫** 支持開發
2. 🐛 **提交 Issue** 報告問題
3. 🔀 **Fork 這個項目** 自定義修改
4. 💬 **分享你的作品** 在 GitHub Discussions

### 📊 功能總覽

| 功能 | 免費版 | 付費版 |
|------|--------|--------|
| 模型數量 | 17 個 | 18 個 |
| 提供商 | Pollinations | Pollinations + Cloudflare |
| 風格預設 | 12 種 | 12 種 |
| 自動高清 | ✅ | ✅ |
| 智能優化 | ✅ | ✅ |
| 多圖輸入 | ❌ | ✅ (最多4張) |
| Hex 色碼 | ❌ | ✅ |
| 成本估算 | 免費 | ✅ 實時顯示 |
| NSFW 支持 | ✅ | ✅ |
| API 兼容 | OpenAI | OpenAI |
| 使用限制 | 無限 | 按量計費 |

---

<div align="center">
  <sub>Made with ❤️ by <a href="https://github.com/kinai9661">kinai9661</a></sub>
  <br>
  <sub>Powered by Cloudflare Workers & Pollinations.ai</sub>
  <br><br>
  <strong>v9.0.0 - 2025-12-04</strong>
</div>
