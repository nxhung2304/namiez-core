# Code Review: [Feature Name]

## Overview
[TÛm tØt ngØn gÕn v¡ feature v‡ scope cÁa review]

## Summary
- **Status**:  Approved / † Approved with Comments / L Changes Required
- **Files Reviewed**: X files
- **Total Issues**: X critical, Y major, Z minor
- **Review Time**: [Duration]
- **Reviewer**: [Reviewer Agent]

## Files Reviewed
- `path/to/file1.py` - [Lines changed, scope]
- `path/to/file2.js` - [Lines changed, scope]
- `path/to/file3.ts` - [Lines changed, scope]

## Detailed Findings

### =4 Critical Issues
Critical issues must be fixed before merge. These block deployment.

1. **[Issue Title]**
   - **File**: `path/to/file.py:123`
   - **Problem**: [Detailed description of the issue]
   - **Impact**: [Why this is critical - security risk, data loss, system crash, etc.]
   - **Suggestion**: [Specific fix recommendation]
   - **Code Example**: 
     ```python
     # Show problematic code and suggested fix
     ```

### =· Major Issues
Major issues should be fixed before merge but don't block urgent deployments.

1. **[Issue Title]**
   - **File**: `path/to/file.js:45`
   - **Problem**: [Detailed description of the issue]
   - **Impact**: [Why this is important - performance, maintainability, etc.]
   - **Suggestion**: [Specific fix recommendation]
   - **Code Example**:
     ```javascript
     // Show problematic code and suggested fix
     ```

2. **[Issue Title]**
   - **File**: `path/to/file.py:78`
   - **Problem**: [Detailed description of the issue]
   - **Impact**: [Why this is important]
   - **Suggestion**: [Specific fix recommendation]

### =5 Minor Issues / Suggestions
Minor improvements and style suggestions.

1. **[Issue Title]**
   - **File**: `path/to/file.py:156`
   - **Suggestion**: [Improvement recommendation]
   - **Reason**: [Why this would be better]

2. **[Issue Title]**
   - **File**: `path/to/file.js:23`
   - **Suggestion**: [Improvement recommendation]

## Positive Highlights
- [i√m t—t 1 - Specific things done well]
- [i√m t—t 2 - Good practices followed]
- [i√m t—t 3 - Creative solutions]

## Security Review
- [ ] Input validation implemented correctly
- [ ] No hardcoded secrets or credentials
- [ ] SQL injection prevention in place
- [ ] XSS protection implemented
- [ ] Authentication/authorization properly handled
- [ ] Error messages don't leak sensitive information

## Performance Review
- [ ] No obvious performance bottlenecks
- [ ] Database queries optimized
- [ ] Appropriate caching implemented
- [ ] Memory usage considered
- [ ] Scalability concerns addressed

## Testing Review
- [ ] Adequate test coverage
- [ ] Test cases cover edge cases
- [ ] Tests are maintainable
- [ ] Integration tests included where needed

## Code Quality Assessment

### Maintainability
- **Score**: [1-10]
- **Notes**: [Comments on code readability, structure, etc.]

### Documentation
- **Score**: [1-10]
- **Notes**: [Comments, README updates, API docs, etc.]

### Error Handling
- **Score**: [1-10]
- **Notes**: [Exception handling, logging, user feedback]

### Best Practices
- **Score**: [1-10]
- **Notes**: [SOLID principles, design patterns, etc.]

## Requirements Compliance
- [ ] All functional requirements implemented
- [ ] All acceptance criteria met
- [ ] Edge cases handled appropriately
- [ ] Out of scope items correctly excluded

## Recommendations

### Immediate Actions (Required)
1. [Action 1 - Must be done before merge]
2. [Action 2 - Must be done before merge]

### Strongly Recommended
1. [Recommendation 1 - Should be done if time permits]
2. [Recommendation 2 - Should be done if time permits]

### Future Improvements
1. [Improvement 1 - Can be done in future iteration]
2. [Improvement 2 - Can be done in future iteration]

## Learning Opportunities
- [Lesson 1 - What team can learn from this PR]
- [Lesson 2 - Best practices to reinforce]

## Next Steps
- [ ] Fix critical issues
- [ ] Address major issues  
- [ ] Consider minor suggestions
- [ ] Update tests if needed
- [ ] Re-run test suite
- [ ] Ready for Testing

## Files to Monitor
[List files that might need extra attention in deployment]

---
**Review Status**: Completed/In Progress/Blocked  
**Reviewer**: [Reviewer Agent]  
**Date Reviewed**: [Date]  
**Time Spent**: [Duration]  
**Implementation Reference**: `.ai/implementation/{issue-name}.md`