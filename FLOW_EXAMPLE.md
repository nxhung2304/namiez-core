# AI Core Flow - Usage Example

## How to Use AI Core Flow

### 1. Start the Flow
Simply type in Claude Code:
```
ai-core-flow
```

### 2. Choose Your Project Type
The system will respond:
```
🚀 AI Core Flow - Let's build something great!

What would you like to work on today?
1. New Feature
2. Bug Fix
3. Code Review
4. Refactoring
5. Custom Workflow

Choose option (1-5):
```

### 3. Example Flow - New Feature
Let's say you choose "1. New Feature":

```
📝 Starting New Feature Workflow...

Current Stage: Requirements Analyst
I'll help you clarify what needs to be built.

Tell me about the feature you want to implement:
```

### 4. Requirements Stage
You respond:
```
I need to add user authentication to my web app. It should support:
- Email and password login
- JWT token generation
- Password reset functionality
- Session management
- Admin role assignment
```

The Requirements Analyst processes this and creates documentation:
```
✅ Requirements Analysis Complete!

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

### 5. Continue to Implementation
Choose "1" to continue:
```
🔄 Moving to Coder Agent...

I've read your requirements. Let me implement the user authentication system.

I can see this involves:
- User model with email/password fields
- Authentication middleware
- JWT token generation
- Password reset endpoints
- Session management

Let me start implementing...
```

The Coder Agent works through the implementation and when done:
```
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

### 6. Code Review Stage
Choose "1" for review:
```
🔍 Starting Code Review...

I'm reviewing the authentication implementation against best practices...

Review Complete!
Generated: .ai/implementation/user-authentication.md

Status: ✅ Approved with minor comments
Issues Found: 0 critical, 2 minor

Minor Issues:
1. Add input sanitization to email validation
2. Consider rate limiting for login attempts

What's next?
1. Continue to Tester Agent
2. End Flow
3. View Review Details
4. Go Back to Implementation

Choose option (1-4):
```

### 7. Testing Stage
Choose "1" for testing:
```
🧪 Starting Testing...

I'll test the authentication system comprehensively...

Testing Complete!
Generated: .ai/testing/user-authentication.md

Status: ✅ All tests passed
Test Cases: 15 passed, 0 failed

Coverage:
- Functional Tests: ✅ Complete
- Security Tests: ✅ Complete  
- Edge Cases: ✅ Complete
- Integration Tests: ✅ Complete

What's next?
1. Continue to Refactor Agent
2. End Flow (deployment ready)
3. View Test Results
4. Go Back to Review

Choose option (1-4):
```

### 8. Final Refactor
Choose "1" for refactoring:
```
⚡ Starting Refactoring...

I'll optimize the authentication code for better maintainability...

Refactoring Complete!
Generated: .ai/refactor/user-authentication.md

Improvements Made:
- Extracted validation logic
- Simplified error handling
- Improved naming conventions
- Added comprehensive documentation
- Optimized database queries

Code Quality Metrics:
- Complexity: Reduced by 30%
- Lines of Code: Reduced by 15%
- Test Coverage: Increased to 95%

🎉 Flow Complete!

Summary Generated: .ai/coordinator/SUMMARY-user-authentication.md

Your authentication system is ready for deployment!
```

## Flow Navigation Commands

During the flow, you can use these commands:

- `next agent` - Move to next stage
- `previous agent` - Go back one stage  
- `jump to tester` - Jump to specific agent
- `show progress` - See current status:
  ```
  📊 Flow Status:
  Stage: 3/5 - Reviewer Agent
  Previous: Requirements ✅, Implementation ✅
  Current: Code review in progress...
  Next: Tester (upcoming)
  
  Generated Documents:
  - .ai/requirements/user-auth.md ✅
  - .ai/implementation/user-auth.md ✅
  ```
- `view outputs` - See all generated documentation
- `end flow` - Complete and generate summary

## Benefits of AI Core Flow

1. **Single Session**: Stay in Claude Code throughout
2. **Context Preservation**: Each agent knows what previous agents did
3. **Flexible Navigation**: Skip stages or go back as needed
4. **Auto-Documentation**: Everything is documented automatically
5. **Progress Tracking**: Always know where you are in the process
6. **Complete Workflow**: From idea to production-ready code

## Generated Documentation

At the end, you'll have:
- `.ai/requirements/user-authentication.md` - Complete requirements
- `.ai/implementation/user-authentication.md` - Implementation details
- `.ai/review/user-authentication.md` - Code review report
- `.ai/testing/user-authentication.md` - Test results
- `.ai/refactor/user-authentication.md` - Refactoring documentation
- `.ai/coordinator/SUMMARY-user-authentication.md` - Project summary

All with full context and cross-references between stages!