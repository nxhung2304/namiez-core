# AI Core Flow - Usage Examples

## Perfect! Now You Can Use Agents Directly

After setup, you'll have this structure:
```
your-project/
├── .claude/
│   └── agents/
│       ├── ai-core-flow.md     🎯 Main orchestrator
│       ├── requirements.md     📋 Requirements analysis
│       ├── coder.md            💻 Implementation
│       ├── reviewer.md         🔍 Code review
│       ├── tester.md           🧪 Testing
│       ├── refactor.md         ⚡ Code improvement
│       └── coordinator.md      📊 Project overview
├── .ai/
│   ├── requirements/           📄 Generated docs
│   ├── implementation/
│   ├── review/
│   ├── testing/
│   ├── refactor/
│   ├── coordinator/
│   └── flows/
└── .ai-config.json           ⚙️ Configuration
```

## 🚀 How to Use

### 1. Start Complete Workflow (Recommended)
```
ai-core-flow
```

This starts the orchestrator that guides you through the complete development process.

### 2. Use Individual Agents
```
requirements          # Clarify what to build
coder                 # Implement the solution
reviewer              # Review code quality
tester                # Test functionality
refactor              # Improve code quality
coordinator           # Project overview
```

### 3. Quick Workflows

#### Bug Fix
```
ai-core-flow → (choose Bug Fix) → coder → tester
```

#### Code Review Only
```
reviewer
```

#### Enhancement
```
ai-core-flow → (choose Enhancement) → requirements → coder → tester
```

## 🎯 Complete Workflow Example

### Step 1: Start the Flow
```
You: ai-core-flow

AI: 🚀 AI Core Flow - Let's build something great!

What would you like to work on today?
1. New Feature
2. Bug Fix
3. Code Review
4. Refactoring
5. Custom Workflow

Choose option (1-5):
```

### Step 2: Choose New Feature
```
You: 1

AI: 📝 Starting New Feature Workflow...

Current Stage: Requirements Analyst
I'll help you clarify what needs to be built.

Tell me about the feature you want to implement:
```

### Step 3: Describe Your Feature
```
You: I need to add user authentication to my web app. It should support:
- Email and password login
- JWT token generation
- Password reset functionality
- Session management
- Admin role assignment

AI: ✅ Requirements Analysis Complete!

Generated: .ai/requirements/user-authentication.md

Summary:
- Feature: User Authentication System
- Complexity: High
- Security Requirements: Critical
- Estimated Timeline: 3-5 days

What's next?
1. Continue to Coder Agent (implement solution)
2. Skip to Reviewer (if you have code ready)
3. Skip to Tester (if implementation and review done)
4. End Flow (save and exit)
5. View Previous Outputs
6. Modify Current Output

Choose option (1-6):
```

### Step 4: Continue Through the Flow
```
You: 1

AI: 🔄 Moving to Coder Agent...

I've read your requirements. Let me implement the user authentication system...

[...Implementation process...]

✅ Implementation Complete!

Generated: .ai/implementation/user-authentication.md

Files Created/Modified:
- models/User.js
- middleware/auth.js
- routes/auth.js
- services/jwtService.js
- services/emailService.js

What's next?
1. Continue to Reviewer Agent
2. Skip to Tester Agent
3. View Implementation Details
4. Modify Implementation
5. End Flow

Choose option (1-5):
```

### Step 5: Continue Through All Stages
The flow continues through:
- **Reviewer Agent** - Code quality checks
- **Tester Agent** - Comprehensive testing
- **Refactor Agent** - Code optimization

### Step 6: Complete the Flow
```
AI: 🎉 Flow Complete!

Summary Generated: .ai/coordinator/SUMMARY-user-authentication.md

Your authentication system is ready for deployment!

Generated Documents:
- .ai/requirements/user-authentication.md ✅
- .ai/implementation/user-authentication.md ✅
- .ai/review/user-authentication.md ✅
- .ai/testing/user-authentication.md ✅
- .ai/refactor/user-authentication.md ✅
- .ai/coordinator/SUMMARY-user-authentication.md ✅

Total Time: 2h 45m
Quality Score: 9.2/10

End flow? (y/n):
```

## 🎮 Navigation Commands

### During Flow
```
continue or next         # Move to next agent
previous or back         # Go back one stage
jump to reviewer         # Jump to specific agent
show progress            # Display current status
view outputs             # Show all generated docs
end flow                # Complete and save
```

### Flow Status Example
```
You: show progress

AI: 📊 Flow Status:
Stage: 3/5 - Reviewer Agent
Previous: Requirements ✅, Implementation ✅
Current: Code review in progress...
Next: Tester (upcoming)

Generated Documents:
- .ai/requirements/user-auth.md ✅
- .ai/implementation/user-auth.md ✅

Time spent: 1h 30m
Next Action: Continue to tester
```

## 🎯 Benefits of This Approach

1. **Direct Access**: Just type the agent name - no special commands needed
2. **Single Session**: Stay in Claude Code the entire time
3. **Context Preservation**: Each agent knows what previous agents did
4. **User Control**: You decide when to move to the next agent
5. **Flexible Navigation**: Skip stages, go back, or jump around as needed
6. **Auto-Documentation**: Everything is documented automatically

## 📁 What You Get

At the end of a complete flow, you'll have:
- **Complete requirements documentation**
- **Fully implemented, reviewed, and tested code**
- **Refactored, production-ready solution**
- **Comprehensive project summary**
- **Full audit trail of the entire process**

All stored in the `.ai/` directory with proper organization and cross-references!

## 💡 Pro Tips

1. **Use ai-core-flow for complete projects** - it maintains context across all stages
2. **Stay in control** - you decide when to move to the next agent
3. **Jump around** - go back to previous agents or skip ahead as needed
4. **Auto-documentation** - everything is documented automatically, no extra work needed

This gives you exactly what you wanted: clean, direct agent access with a unified flow that maintains context throughout your entire development process! 🚀