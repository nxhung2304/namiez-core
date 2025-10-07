#!/bin/bash
set -e

# AI Core Flow Setup Script
# Sets up ai-core with unified flow orchestration

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Default values
REPO_URL="https://github.com/your-username/ai-core.git"
BRANCH="main"
PROJECT_PATH=""
AI_CORE_VERSION="1.0.0"

# Functions
print_usage() {
    echo "AI Core Flow Setup Script"
    echo ""
    echo "Usage: $0 [OPTIONS] PROJECT_PATH"
    echo ""
    echo "Options:"
    echo "  -h, --help              Show this help message"
    echo "  -r, --repo URL          Custom ai-core repository URL"
    echo "  -b, --branch BRANCH     Specific branch to use (default: main)"
    echo ""
    echo "Examples:"
    echo "  $0 /path/to/my-project"
    echo "  $0 --repo https://github.com/my-org/ai-core.git /path/to/project"
    echo ""
    echo "This script sets up AI Core Flow for unified agent orchestration."
    echo ""
    echo "After setup, simply type 'ai-core-flow' in Claude Code to start!"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

print_header() {
    echo -e "${BLUE}================================${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}================================${NC}"
}

# Check if required dependencies are installed
check_dependencies() {
    print_header "Checking Dependencies"
    
    if ! command -v git &> /dev/null; then
        print_error "Git is not installed. Please install git first."
        exit 1
    fi
    print_success "Git is installed"
    
    if [ ! -w "$(dirname "$PROJECT_PATH")" ]; then
        print_error "Cannot write to parent directory of $PROJECT_PATH"
        exit 1
    fi
    print_success "Directory permissions OK"
}

# Create directory structure
setup_flow_structure() {
    print_header "Setting Up AI Core Flow Structure"
    
    local project_root="$PROJECT_PATH"
    
    # Create main .ai directory
    mkdir -p "$project_root/.ai"
    print_success "Created .ai directory"
    
    # Create subdirectories for all agents
    local dirs=("requirements" "implementation" "review" "testing" "refactor" "coordinator")
    
    for dir in "${dirs[@]}"; do
        mkdir -p "$project_root/.ai/$dir"
        print_success "Created .ai/$dir directory"
    done
    
    # Create .claude directory
    mkdir -p "$project_root/.claude"
    print_success "Created .claude directory"
    
    # Create flows directory for flow state management
    mkdir -p "$project_root/.ai/flows"
    print_success "Created .ai/flows directory"
}

# Install flow agent and all supporting agents
install_flow_agents() {
    print_header "Installing AI Core Flow Agents"
    
    local project_root="$PROJECT_PATH"
    local claude_dir="$project_root/.claude"
    
    # Copy the main flow agent
    if [ -f "agents/flow.md" ]; then
        cp "agents/flow.md" "$claude_dir/"
        print_success "Installed AI Core Flow agent"
    else
        print_error "Flow agent not found!"
        exit 1
    fi
    
    # Copy all supporting agents (they'll be called by the flow agent)
    local agents=("requirements.md" "coder.md" "reviewer.md" "tester.md" "refactor.md" "coordinator.md")
    
    for agent in "${agents[@]}"; do
        if [ -f "agents/$agent" ]; then
            cp "agents/$agent" "$claude_dir/"
            print_success "Installed supporting agent: $agent"
        else
            print_warning "Supporting agent not found: $agent"
        fi
    done
    
    # Create flow configuration
    cat > "$claude_dir/flow-config.json" << EOF
{
  "version": "$AI_CORE_VERSION",
  "flow_type": "unified",
  "agents": {
    "flow": {
      "file": "flow.md",
      "role": "orchestrator"
    },
    "requirements": {
      "file": "requirements.md",
      "output_dir": ".ai/requirements"
    },
    "coder": {
      "file": "coder.md", 
      "output_dir": ".ai/implementation"
    },
    "reviewer": {
      "file": "reviewer.md",
      "output_dir": ".ai/review"
    },
    "tester": {
      "file": "tester.md",
      "output_dir": ".ai/testing"
    },
    "refactor": {
      "file": "refactor.md",
      "output_dir": ".ai/refactor"
    },
    "coordinator": {
      "file": "coordinator.md",
      "output_dir": ".ai/coordinator"
    }
  },
  "workflows": {
    "standard": ["requirements", "coder", "reviewer", "tester", "refactor"],
    "quick": ["coder", "tester"],
    "review_only": ["reviewer"],
    "bug_fix": ["coder", "tester"],
    "custom": []
  },
  "settings": {
    "auto_progress": false,
    "show_summaries": true,
    "save_intermediate": true,
    "allow_skipping": true,
    "require_confirmation": true
  }
}
EOF
    
    print_success "Created flow configuration"
}

# Create templates for unified flow
setup_flow_templates() {
    print_header "Setting Up Flow Templates"
    
    local project_root="$PROJECT_PATH"
    
    # Create templates directory
    mkdir -p "$project_root/.ai-templates"
    print_success "Created templates directory"
    
    # Copy all templates
    if [ -d "templates" ]; then
        cp -r templates/* "$project_root/.ai-templates/"
        print_success "Copied agent templates"
    fi
    
    # Create flow-specific templates
    cat > "$project_root/.ai-templates/flow-status.md" << EOF
# AI Core Flow Status

**Project**: {project-name}
**Started**: {start-time}
**Current Stage**: {current-stage}
**Progress**: {progress}

## Completed Stages
{completed-stages}

## Current Stage: {current-stage}
**Agent**: {current-agent}
**Started**: {stage-start-time}
**Status**: {status}

## Generated Documents
{generated-documents}

## Context Summary
{context-summary}

## Next Steps
{next-steps}

---
*Flow Status Generated: {timestamp}*
EOF
    
    cat > "$project_root/.ai-templates/flow-summary.md" << EOF
# AI Core Flow Summary

**Project**: {project-name}
**Total Duration**: {total-duration}
**Stages Completed**: {stages-completed}
**Success**: {success-status}

## Workflow Used
{workflow-used}

## Stage Details
{stage-details}

## Documents Generated
{documents-list}

## Quality Metrics
{quality-metrics}

## Key Achievements
{achievements}

## Challenges & Solutions
{challenges}

## Lessons Learned
{lessons-learned}

## Recommendations
{recommendations}

---
*Flow Completed: {completion-timestamp}*
EOF
    
    print_success "Created flow-specific templates"
}

# Create project documentation optimized for flow
create_flow_documentation() {
    print_header "Creating Flow Documentation"
    
    local project_root="$PROJECT_PATH"
    
    # Create main README focused on flow usage
    cat > "$project_root/README.md" << EOF
# $(basename "$project_root")

AI-assisted development with unified flow orchestration.

## 🚀 Quick Start

1. **Start the flow**:
   \`\`\`bash
   ai-core-flow
   \`\`\`

2. **Follow the guided workflow** through each agent
3. **Stay in Claude Code** - no need to switch agents manually
4. **Generate complete documentation** automatically

## 📋 Workflow Stages

1. **Requirements Analyst** - Clarify what to build
2. **Senior Developer** - Implement the solution  
3. **Code Reviewer** - Ensure quality and best practices
4. **QA Engineer** - Test functionality thoroughly
5. **Code Quality Specialist** - Refactor and optimize

## 🎯 Features

- **Unified Interface**: Single command to manage entire workflow
- **Context Preservation**: Maintain state across all agents
- **Flexible Navigation**: Skip stages or jump between agents
- **Auto-Documentation**: Generate comprehensive docs at each stage
- **Progress Tracking**: Clear visibility into workflow status

## 📁 Generated Documentation

All outputs are stored in \`.ai/\` directory:

- \`.ai/requirements/\` - Requirements analysis
- \`.ai/implementation/\` - Implementation details
- \`.ai/review/\` - Code review reports
- \`.ai/testing/\` - Test results
- \`.ai/refactor/\` - Refactoring documentation
- \`.ai/flows/\` - Flow state and tracking

## ⚙️ Configuration

Customize your workflow in \`.ai-config.json\`:

\`\`\`json
{
  "flow": {
    "auto_progress": false,
    "show_summaries": true,
    "save_intermediate": true
  }
}
\`\`\`

## 🔄 Flow Commands

- \`ai-core-flow\` - Start new flow
- \`next agent\` - Move to next stage
- \`previous agent\` - Go back one stage
- \`jump to [agent]\` - Jump to specific agent
- \`show progress\` - Display flow status
- \`view outputs\` - Show all generated docs
- \`end flow\` - Complete and save

## 💡 Tips

- **Stay in Context**: Let the flow guide you through each stage
- **Review Outputs**: Each agent generates documentation for review
- **Flexible Path**: Skip stages if needed, or jump back to make changes
- **Save Progress**: Flow state is automatically preserved

---

*Generated by AI Core Flow v$AI_CORE_VERSION*
EOF
    
    # Create .ai README for flow
    cat > "$project_root/.ai/README.md" << EOF
# AI Development Flow

This directory contains all AI-generated documentation and flow state.

## 🗂️ Directory Structure

- \`requirements/\`     - Requirements analysis documents
- \`implementation/\`  - Implementation documentation  
- \`review/\`          - Code review reports
- \`testing/\`         - Test results and reports
- \`refactor/\`        - Refactoring documentation
- \`coordinator/\`     - Project coordination and tracking
- \`flows/\`           - Flow state and session management

## 🔄 Flow Management

Flow sessions are automatically saved in \`flows/\` directory:
- \`FLOW-STATUS-{project}.md\` - Current flow state
- \`FLOW-SUMMARY-{project}.md\` - Completed flow summary

## 📊 Viewing Progress

During an active flow, check status with:
- \`show progress\` - Display current stage and progress
- \`view outputs\` - See all generated documents

## 🎯 Navigation

Use flow commands to navigate:
- Move between agents seamlessly
- Jump back to modify previous outputs  
- Maintain context across all stages

For detailed usage, see the main project README.
EOF
    
    print_success "Created flow-focused documentation"
}

# Create configuration optimized for flow
create_flow_config() {
    print_header "Creating Flow Configuration"
    
    local project_root="$PROJECT_PATH"
    
    cat > "$project_root/.ai-config.json" << EOF
{
  "version": "$AI_CORE_VERSION",
  "name": "$(basename "$project_root")",
  "description": "AI-assisted development with unified flow",
  "flow_mode": "unified",
  "flow_agent": "flow.md",
  
  "agents": {
    "flow": {
      "enabled": true,
      "file": ".claude/flow.md",
      "role": "orchestrator",
      "manages_workflow": true
    },
    "requirements": {
      "enabled": true,
      "file": ".claude/requirements.md",
      "output_dir": ".ai/requirements",
      "template": ".ai-templates/requirements_template.md"
    },
    "coder": {
      "enabled": true,
      "file": ".claude/coder.md", 
      "output_dir": ".ai/implementation",
      "template": ".ai-templates/implementation_template.md"
    },
    "reviewer": {
      "enabled": true,
      "file": ".claude/reviewer.md",
      "output_dir": ".ai/review",
      "template": ".ai-templates/review_template.md"
    },
    "tester": {
      "enabled": true,
      "file": ".claude/tester.md",
      "output_dir": ".ai/testing",
      "template": ".ai-templates/testing_template.md"
    },
    "refactor": {
      "enabled": true,
      "file": ".claude/refactor.md",
      "output_dir": ".ai/refactor",
      "template": ".ai-templates/refactor_template.md"
    },
    "coordinator": {
      "enabled": true,
      "file": ".claude/coordinator.md",
      "output_dir": ".ai/coordinator"
    }
  },
  
  "flow_settings": {
    "auto_progress": false,
    "show_summaries": true,
    "save_intermediate": true,
    "allow_skipping": true,
    "require_confirmation": true,
    "maintain_context": true,
    "generate_docs": true
  },
  
  "workflows": {
    "standard": {
      "agents": ["requirements", "coder", "reviewer", "tester", "refactor"],
      "description": "Complete development workflow"
    },
    "quick": {
      "agents": ["coder", "tester"],
      "description": "Fast implementation and testing"
    },
    "review_only": {
      "agents": ["reviewer"],
      "description": "Code review only"
    },
    "bug_fix": {
      "agents": ["coder", "tester"],
      "description": "Bug fix workflow"
    },
    "enhancement": {
      "agents": ["requirements", "coder", "tester"],
      "description": "Feature enhancement workflow"
    }
  },
  
  "output": {
    "flow_state_dir": ".ai/flows",
    "status_template": ".ai-templates/flow-status.md",
    "summary_template": ".ai-templates/flow-summary.md",
    "auto_save": true,
    "timestamp_format": "YYYY-MM-DD HH:mm:ss"
  },
  
  "navigation": {
    "commands": {
      "start": "ai-core-flow",
      "resume": "ai-core-flow --resume",
      "next": "next agent",
      "previous": "previous agent",
      "jump": "jump to [agent]",
      "status": "show progress",
      "outputs": "view outputs",
      "end": "end flow"
    }
  },
  
  "git": {
    "track_ai_docs": true,
    "ignore_patterns": [
      ".ai/flows/FLOW-STATUS-*",
      "*.tmp",
      "*.log"
    ]
  }
}
EOF
    
    print_success "Created flow configuration"
}

# Create quick start guide
create_quick_start() {
    print_header "Creating Quick Start Guide"
    
    local project_root="$PROJECT_PATH"
    
    cat > "$project_root/QUICKSTART.md" << EOF
# AI Core Flow - Quick Start

## 🚀 5 Minutes to Productive AI Development

### Step 1: Start Your First Flow
Type in Claude Code:
\`\`\`
ai-core-flow
\`\`\`

### Step 2: Choose Your Workflow
\`\`\`
What would you like to work on?
1. New Feature
2. Bug Fix
3. Code Review  
4. Refactoring

Choose option (1-4):
\`\`\`

### Step 3: Follow the Guided Process
The flow will guide you through each stage:
1. **Requirements** - Describe what you want to build
2. **Implementation** - AI helps you code it
3. **Review** - Quality check and improvements
4. **Testing** - Verify it works correctly
5. **Refactor** - Polish and optimize

### Step 4: Navigate the Flow
At each stage, you'll see options like:
\`\`\`
✅ Requirements Complete!

Generated: .ai/requirements/user-auth.md

What's next?
1. Continue to Coder Agent
2. Skip to Reviewer
3. View Previous Outputs
4. End Flow

Choose option (1-4):
\`\`\`

## 💡 Pro Tips

### Stay in Control
- Use \`next agent\` to progress
- Use \`previous agent\` to go back
- Use \`jump to reviewer\` to skip ahead
- Use \`show progress\` anytime to see status

### Context is King
- All previous stages inform the next
- You can jump back to modify anything
- Documentation updates automatically

### Save Your Work
- Flow state is auto-saved
- Use \`end flow\` to complete and generate summary
- All documents stored in \`.ai/\` directory

## 🎯 Example: Building User Authentication

### Start the Flow
\`\`\`
ai-core-flow
\`\`\`

### Choose New Feature
\`\`\`
1. New Feature
\`\`\`

### Describe Requirements
\`\`\`
I need user authentication with:
- Email/password login
- JWT tokens
- Password reset functionality
- Session management
\`\`\`

### Follow Through Each Stage
The flow will guide you through implementation, review, testing, and refactoring - all while staying in the same Claude Code session!

### End Result
You'll have:
- Complete requirements documentation
- Fully implemented code
- Code review report
- Test results
- Refactored, production-ready code
- Complete project documentation

All generated automatically, with full context maintained throughout!

## 🆘 Need Help?

- Type \`show progress\` anytime to see where you are
- Use \`view outputs\` to see all generated documents
- Check \`.ai/README.md\` for detailed documentation

Happy building with AI Core Flow! 🚀
EOF
    
    print_success "Created quick start guide"
}

# Parse command line arguments
parse_args() {
    while [[ $# -gt 0 ]]; do
        case $1 in
            -h|--help)
                print_usage
                exit 0
                ;;
            -r|--repo)
                REPO_URL="$2"
                shift 2
                ;;
            -b|--branch)
                BRANCH="$2"
                shift 2
                ;;
            -*)
                print_error "Unknown option: $1"
                print_usage
                exit 1
                ;;
            *)
                if [ -z "$PROJECT_PATH" ]; then
                    PROJECT_PATH="$1"
                else
                    print_error "Multiple project paths provided"
                    print_usage
                    exit 1
                fi
                shift
                ;;
        esac
    done
}

# Validate arguments
validate_args() {
    if [ -z "$PROJECT_PATH" ]; then
        print_error "PROJECT_PATH is required"
        print_usage
        exit 1
    fi
    
    # Convert to absolute path
    if [[ "$PROJECT_PATH" != /* ]]; then
        PROJECT_PATH="$(pwd)/$PROJECT_PATH"
    fi
    
    # Create project directory if it doesn't exist
    mkdir -p "$PROJECT_PATH"
}

# Main execution
main() {
    print_header "AI Core Flow Setup v$AI_CORE_VERSION"
    
    parse_args "$@"
    validate_args
    
    print_info "Setting up AI Core Flow in: $PROJECT_PATH"
    
    check_dependencies
    setup_flow_structure
    install_flow_agents
    setup_flow_templates
    create_flow_documentation
    create_flow_config
    create_quick_start
    
    # Create version file
    echo "$AI_CORE_VERSION" > "$PROJECT_PATH/.ai-version"
    
    print_header "Setup Complete! 🎉"
    print_success "AI Core Flow is ready to use!"
    print_info "Project directory: $PROJECT_PATH"
    
    echo ""
    print_info "🚀 Quick Start:"
    print_info "1. cd $PROJECT_PATH"
    print_info "2. Type 'ai-core-flow' in Claude Code"
    print_info "3. Follow the guided workflow"
    
    echo ""
    print_info "📚 Documentation:"
    print_info "- README.md - Complete guide"
    print_info "- QUICKSTART.md - 5-minute tutorial"
    print_info "- .ai/README.md - Flow documentation"
    
    print_success "Happy building with AI Core Flow! 🚀"
}

# Run main function with all arguments
main "$@"