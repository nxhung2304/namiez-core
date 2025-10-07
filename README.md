# ai-core

AI Agent System cho Development Workflow - Tự động hóa quy trình phát triển từ requirements đến deployment.

## 🚀 Quick Start

### 1. Cài đặt vào project

```bash
# Clone repo này
git clone https://github.com/your-username/ai-core.git

# Chạy setup cho project của bạn
cd ai-core
bash scripts/setup.sh /path/to/your/project
```

### 2. Sử dụng

```bash
cd /path/to/your/project

# Bắt đầu với requirements
claude code --agent requirements

# Tiếp tục với các agent khác
claude code --agent coder
claude code --agent reviewer
claude code --agent tester
claude code --agent refactor
```

## 📋 Features

### 5 Core Agents

1. **Requirements Agent** - Phân tích và làm rõ yêu cầu
2. **Coder Agent** - Implement code theo requirements
3. **Reviewer Agent** - Review code quality và security
4. **Tester Agent** - Test thoroughly với checklist
5. **Refactor Agent** - Optimize và improve code

### Coordinator Agent (Optional)

6. **Coordinator Agent** - Điều phối toàn bộ workflow, tracking progress

## 🏗️ Cấu trúc Project sau khi setup

```
your-project/
├── .ai/
│   ├── requirements/      # Requirements docs
│   ├── implementation/    # Implementation docs
│   ├── review/           # Code review reports
│   ├── testing/          # Test reports
│   ├── refactor/         # Refactor reports
│   ├── coordinator/      # Tracking (if enabled)
│   ├── templates/        # Document templates
│   ├── .ai-config.json   # Config
│   └── README.md         # Usage guide
│
└── .claude/
    ├── requirements.md
    ├── coder.md
    ├── reviewer.md
    ├── tester.md
    ├── refactor.md
    └── coordinator.md
```

## 🔄 Workflow

### Full Workflow (Feature mới)
```
Requirements → Coder → Reviewer → Tester → Refactor
```

### Quick Workflow (Bug fix)
```
Coder → Tester
```

### Review Workflow (Code review)
```
Reviewer → Tester
```

## 📖 Usage Examples

### Tạo feature mới

```bash
# 1. Thảo luận requirements
claude code --agent requirements
# Output: .ai/requirements/user-authentication.md

# 2. Implement
claude code --agent coder
# Agent hỏi: "File requirements nào?"
# Bạn: ".ai/requirements/user-authentication.md"
# Output: Code + .ai/implementation/user-authentication.md

# 3. Review
claude code --agent reviewer
# Output: .ai/review/user-authentication.md

# 4. Test
claude code --agent tester
# Output: .ai/testing/user-authentication.md

# 5. Refactor (optional)
claude code --agent refactor
# Output: .ai/refactor/user-authentication.md
```

### Fix bug nhanh

```bash
# 1. Code fix
claude code --agent coder

# 2. Test
claude code --agent tester
```

### Tracking với Coordinator

```bash
# Enable coordinator trong .ai/.ai-config.json
claude code --agent coordinator

# Coordinator sẽ:
# - Suggest workflow
# - Track progress
# - Generate reports
```

## 🛠️ Setup Script Options

```bash
# Setup project hiện tại
bash scripts/setup.sh .

# Setup project cụ thể
bash scripts/setup.sh /path/to/project

# Update ai-core trong project đã setup
bash scripts/setup.sh --update /path/to/project

# Dùng custom repo
bash scripts/setup.sh --repo https://github.com/custom/ai-core.git /path/to/project

# Dùng branch khác
bash scripts/setup.sh --branch dev /path/to/project

# Help
bash scripts/setup.sh --help
```

## ⚙️ Configuration

Edit `.ai/.ai-config.json` để customize:

```json
{
  "agents": {
    "coordinator": {
      "enabled": true  // Enable coordinator agent
    }
  },
  "workflow": {
    "default": ["requirements", "coder", "tester"]  // Custom workflow
  },
  "naming": {
    "prefix_issue_id": true  // ISSUE-123-feature.md
  }
}
```

## 🔧 Advanced Usage

### Custom Agent

Tạo agent riêng:

```bash
# Tạo agent mới
cat > /path/to/project/.claude/security.md << 'EOF'
# Security Audit Agent
...
EOF

# Sử dụng
claude code --agent security
```

### Templates

Customize templates trong `.ai/templates/`:

```bash
# Edit template
nano .ai/templates/requirements_template.md

# Agent sẽ dùng template này
claude code --agent requirements
```

### Git Integration

```bash
# Commit AI docs (recommended)
git add .ai/
git commit -m "docs: Add AI workflow docs"

# Hoặc ignore (không khuyến nghích)
echo ".ai/" >> .gitignore
```

## 📊 Naming Convention

Default: `{ISSUE_ID}-{feature-name}.md`

Examples:
- `FEAT-123-user-authentication.md`
- `BUG-456-fix-login-error.md`
- `REFACTOR-789-optimize-database.md`

## 🔄 Update ai-core

Khi có version mới:

```bash
# Update trong project
cd ai-core
git pull
bash scripts/setup.sh --update /path/to/your/project
```

Check version hiện tại:
```bash
cat /path/to/your/project/.ai/.ai-core-version
```

## 🤝 Contributing

### Tạo agent mới

1. Thêm file vào `agents/`
2. Update `.ai-config.json`
3. Tạo template tương ứng trong `templates/`
4. Update README

### Improve existing agents

1. Edit file trong `agents/`
2. Test thoroughly
3. Update version trong `VERSION`
4. Create PR

## 📝 Best Practices

1. **Luôn bắt đầu với Requirements** cho feature mới
2. **Commit .ai docs** để có audit trail
3. **Review trước khi test** để catch issues sớm
4. **Refactor sau khi stable** để improve quality
5. **Use coordinator** cho complex features

## 🐛 Troubleshooting

### Agent không đọc được file

```bash
# Check file exists
ls .ai/requirements/

# Check permissions
chmod 644 .ai/**/*.md
```

### Setup failed

```bash
# Check git installed
git --version

# Check network
ping github.com

# Try with verbose
bash -x scripts/setup.sh /path/to/project
```

### Agent output không đúng

- Check agent file syntax
- Remind agent về output format trong chat
- Edit agent instructions nếu cần

## 📜 License

MIT License - Feel free to use and modify

## 🔗 Links

- **Repository**: https://github.com/your-username/ai-core
- **Issues**: https://github.com/your-username/ai-core/issues
- **Claude Code Docs**: https://docs.claude.com/en/docs/claude-code

## 📧 Support

- Create issue on GitHub
- Email: your-email@example.com
- Discord: [Your Discord server]

---

**Version**: 1.0.0  
**Last Updated**: 2025-10-07
