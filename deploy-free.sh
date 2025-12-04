#!/bin/bash
# =================================================================================
#  Flux-AI-Pro - 純免費模式部署腳本
#  版本: v9.0.0
#  模式: 開發環境 (僅 Pollinations.ai - 100% 免費)
# =================================================================================

set -e

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🎨 Flux-AI-Pro v9.0.0 - 純免費模式部署"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "📋 部署配置:"
echo "  • 提供商: Pollinations.ai (免費)"
echo "  • 模型數量: 17 個"
echo "  • 風格預設: 12 種"
echo "  • Cloudflare AI: 禁用"
echo "  • 成本: 100% 免費"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# 步驟 1: 檢查 Node.js
echo "[1/5] 🔍 檢查 Node.js..."
if ! command -v node &> /dev/null; then
    echo "❌ 錯誤: 未安裝 Node.js"
    echo "請訪問 https://nodejs.org/ 下載安裝"
    exit 1
fi
echo "✅ Node.js 版本: $(node -v)"
echo ""

# 步驟 2: 檢查/安裝 Wrangler
echo "[2/5] 🔍 檢查 Wrangler CLI..."
if ! command -v wrangler &> /dev/null; then
    echo "⚠️  未檢測到 Wrangler，正在安裝..."
    npm install -g wrangler
    echo "✅ Wrangler 安裝完成"
else
    echo "✅ Wrangler 版本: $(wrangler --version)"
fi
echo ""

# 步驟 3: 登錄 Cloudflare
echo "[3/5] 🔐 登錄 Cloudflare..."
echo "⏳ 即將打開瀏覽器進行授權..."
wrangler login
echo "✅ 登錄成功"
echo ""

# 步驟 4: 部署到開發環境
echo "[4/5] 🚀 部署到開發環境 (純免費模式)..."
echo "⏳ 正在部署..."
wrangler deploy --env dev
echo "✅ 部署完成"
echo ""

# 步驟 5: 獲取部署 URL
echo "[5/5] 🌐 獲取訪問地址..."
WORKER_URL=$(wrangler deployments list --env dev 2>/dev/null | grep -oP 'https://[^\s]+' | head -1 || echo "")

if [ -z "$WORKER_URL" ]; then
    echo "⚠️  無法自動獲取 URL，請手動訪問 Cloudflare Dashboard 查看"
    echo "   Dashboard: https://dash.cloudflare.com/"
else
    echo "✅ Worker URL: $WORKER_URL"
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "🎉 部署成功！"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "📍 訪問地址:"
    echo "   $WORKER_URL"
    echo ""
    echo "🧪 測試接口:"
    echo "   健康檢查: ${WORKER_URL}/health"
    echo "   模型列表: ${WORKER_URL}/v1/models"
    echo "   提供商信息: ${WORKER_URL}/v1/providers"
    echo ""
    echo "📖 功能說明:"
    echo "   • 17 個 AI 模型完全免費"
    echo "   • 自動高清優化 (Auto HD)"
    echo "   • 智能參數優化"
    echo "   • 12 種藝術風格"
    echo "   • NSFW 內容支持"
    echo "   • OpenAI 兼容 API"
    echo ""
    echo "💡 提示:"
    echo "   • 此為開發環境，僅使用免費 Pollinations.ai"
    echo "   • 如需啟用 Cloudflare AI，請使用 deploy-premium.sh"
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
fi

echo ""
echo "🎯 下一步:"
echo "   1. 訪問上方 URL 使用 Web 界面"
echo "   2. 或使用 API 集成到你的應用"
echo "   3. 查看 README.md 了解更多功能"
echo ""
