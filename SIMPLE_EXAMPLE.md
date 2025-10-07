# AI Core Flow - Simple Example

## 🚀 Step-by-Step: Building a Simple To-Do List Feature

### Step 1: Setup Your Project
```bash
# Create a new project
mkdir my-todo-app
cd my-todo-app

# Setup AI Core Flow
bash /path/to/ai-core/scripts/setup.sh .
```

### Step 2: Start the Flow
Open Claude Code and type:
```
ai-core-flow
```

### Step 3: Choose Your Project Type
AI Core Flow will respond:
```
🚀 AI Core Flow - Let's build something great!

What would you like to work on today?
1. New Feature
2. Bug Fix
3. Code Review
4. Refactoring

Choose option (1-5):
```

Type:
```
1
```

### Step 4: Describe Your Feature
AI Core Flow will ask:
```
📝 Starting New Feature Workflow...

Current Stage: Requirements Analyst
Tell me about the feature you want to implement:
```

Type:
```
I want to add a simple to-do list feature to my web app. Users should be able to:
- Add new tasks
- Mark tasks as complete
- Delete tasks
- See all tasks in a list
```

### Step 5: Requirements Analysis
The Requirements Agent will analyze and ask clarifying questions:
```
I understand you want a to-do list feature. Let me clarify a few things:

1. Do tasks need to be saved permanently (database) or just for the session?
2. Should users be able to edit task text after adding?
3. Do you need task priorities or due dates?
4. Should completed tasks be shown or hidden?
```

Type your answers:
```
1. Save permanently in a database
2. Yes, users should be able to edit tasks
3. Simple version for now - just text and completion status
4. Show completed tasks but visually different
```

### Step 6: Requirements Complete
The Requirements Agent creates documentation and asks:
```
✅ Requirements Analysis Complete!

Generated: .ai/requirements/todo-list-feature.md

Summary:
- Feature: Task Management System
- Complexity: Medium
- Database: Required
- Timeline: 1-2 days

What's next?
1. Continue to Coder Agent (implement solution)
2. Skip to Reviewer (if you have code ready)
3. End Flow (save and exit)

Choose option (1-4):
```

Type:
```
1
```

### Step 7: Implementation
The Coder Agent will read the requirements and ask:
```
I'll implement your to-do list feature. I can see you're using a React app with Express backend.

I'll create:
- Todo model for database
- API endpoints (GET, POST, PUT, DELETE)
- React components for the UI
- CSS styling

Which file should I start with, or should I create the API endpoints first?
```

Type:
```
Start with the API endpoints, then the React components
```

### Step 8: Implementation Progress
The Coder Agent will implement step by step:
```
✅ API Implementation Complete!

Created/Modified:
- models/Todo.js
- routes/todos.js
- server.js (added routes)

Created endpoints:
- GET /api/todos - Get all tasks
- POST /api/todos - Add new task
- PUT /api/todos/:id - Update task
- DELETE /api/todos/:id - Delete task

Now implementing React components...
```

### Step 9: Implementation Complete
```
✅ Implementation Complete!

Generated: .ai/implementation/todo-list-feature.md

Files Created/Modified:
- models/Todo.js
- routes/todos.js
- components/TodoList.js
- components/TodoItem.js
- App.js
- styles/Todo.css

What's next?
1. Continue to Reviewer Agent
2. Skip to Tester Agent
3. End Flow

Choose option (1-3):
```

Type:
```
1
```

### Step 10: Code Review
The Reviewer Agent analyzes your code:
```
🔍 Code Review in Progress...

Reviewing your to-do list implementation...

✅ Code Review Complete!

Generated: .ai/review/todo-list-feature.md

Status: ✅ Approved with minor comments
Issues Found: 0 critical, 2 minor

Minor Issues:
1. Add input validation to prevent empty tasks
2. Consider adding loading states for better UX

What's next?
1. Continue to Tester Agent
2. End Flow

Choose option (1-2):
```

Type:
```
1
```

### Step 11: Testing
The Tester Agent will test your feature:
```
🧪 Testing your to-do list feature...

Testing: API endpoints...
✅ GET /api/todos - Working
✅ POST /api/todos - Working
✅ PUT /api/todos/:id - Working
✅ DELETE /api/todos/:id - Working

Testing: React UI...
✅ Add new task - Working
✅ Mark task complete - Working
✅ Delete task - Working
✅ Edit task - Working

✅ Testing Complete!

Generated: .ai/testing/todo-list-feature.md

All tests passed! Your to-do list is ready to use.

What's next?
1. Continue to Refactor Agent
2. End Flow

Choose option (1-2):
```

Type:
```
2
```

### Step 12: Flow Complete!
```
🎉 Flow Complete!

Summary Generated: .ai/coordinator/SUMMARY-todo-list-feature.md

Your to-do list feature is ready for deployment!

📊 Final Results:
- Total Time: 2h 15m
- Quality Score: 9.0/10
- All Tests: ✅ Passed

📁 Generated Documentation:
- .ai/requirements/todo-list-feature.md
- .ai/implementation/todo-list-feature.md
- .ai/review/todo-list-feature.md
- .ai/testing/todo-list-feature.md
- .ai/coordinator/SUMMARY-todo-list-feature.md

Your feature is complete and documented!
```

## 🎯 That's It!

You now have:
- ✅ **Complete requirements documentation**
- ✅ **Fully implemented to-do list feature**
- ✅ **Code review with improvements**
- ✅ **Comprehensive testing**
- ✅ **Complete project documentation**

All generated automatically while you stayed in one Claude Code session!

## 📁 What You Have Now

```
my-todo-app/
├── .ai/
│   ├── requirements/
│   │   └── todo-list-feature.md     # Complete requirements
│   ├── implementation/
│   │   └── todo-list-feature.md     # Implementation details
│   ├── review/
│   │   └── todo-list-feature.md     # Code review report
│   ├── testing/
│   │   └── todo-list-feature.md     # Test results
│   └── coordinator/
│       └── SUMMARY-todo-list-feature.md  # Project summary
├── .claude/
│   └── agents/                      # All your AI agents
├── models/Todo.js                   # Database model
├── routes/todos.js                  # API endpoints
├── components/
│   ├── TodoList.js                  # Main component
│   └── TodoItem.js                  # Individual task component
└── styles/Todo.css                  # Styling
```

## 🚀 Ready for Next Time?

Next time you want to add another feature, just type:
```
ai-core-flow
```

And follow the same simple process!