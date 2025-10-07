# Test Report: [Feature Name]

## Test Summary
- **Date**: [Date of testing]
- **Tester**: [Tester Agent]
- **Status**:  Passed /   Passed with Issues / L Failed
- **Total Test Cases**: X
- **Passed**: Y
- **Failed**: Z
- **Blocked**: N

## Test Environment
- **OS**: [Operating system and version]
- **Browser/Runtime**: [Browser or runtime version]
- **Dependencies**: [Key dependency versions]
- **Database**: [Database version if applicable]
- **Test Data**: [Description of test data used]
- **Test Configuration**: [Any special configuration]

## References
- **Requirements**: `.ai/requirements/{issue-name}.md`
- **Implementation**: `.ai/implementation/{issue-name}.md`
- **Code Review**: `.ai/review/{issue-name}.md`

## Test Cases

###  Passed Tests

1. **Test Case TC-001: [Test Name]**
   - **Description**: [What the test validates]
   - **Category**: [Functional/Edge Case/Integration/Performance]
   - **Priority**: [High/Medium/Low]
   - **Steps**:
     1. [Step 1]
     2. [Step 2]
     3. [Step 3]
   - **Expected Result**: [What should happen]
   - **Actual Result**: [What actually happened]
   - **Status**:  Pass
   - **Duration**: [X seconds/minutes]
   - **Notes**: [Additional observations]

2. **Test Case TC-002: [Test Name]**
   - **Description**: [What the test validates]
   - **Category**: [Functional/Edge Case/Integration/Performance]
   - **Priority**: [High/Medium/Low]
   - **Steps**:
     1. [Step 1]
     2. [Step 2]
   - **Expected Result**: [What should happen]
   - **Actual Result**: [What actually happened]
   - **Status**:  Pass
   - **Duration**: [X seconds/minutes]

### L Failed Tests

1. **Test Case TC-XXX: [Test Name]**
   - **Description**: [What the test validates]
   - **Category**: [Functional/Edge Case/Integration/Performance]
   - **Priority**: [High/Medium/Low]
   - **Steps**:
     1. [Step 1]
     2. [Step 2]
     3. [Step 3]
   - **Expected Result**: [What should happen]
   - **Actual Result**: [What actually happened]
   - **Status**: L Fail
   - **Severity**: [Critical/Major/Minor]
   - **Error Message**: [Error details if any]
   - **Frequency**: [Always happens/Intermittent]
   - **Environment Notes**: [Special conditions when it fails]
   - **Possible Root Cause**: [Analysis of why it might be failing]

2. **Test Case TC-YYY: [Test Name]**
   - **Description**: [What the test validates]
   - **Category**: [Functional/Edge Case/Integration/Performance]
   - **Priority**: [High/Medium/Low]
   - **Steps**: [Steps to reproduce]
   - **Expected Result**: [What should happen]
   - **Actual Result**: [What actually happened]
   - **Status**: L Fail
   - **Severity**: [Critical/Major/Minor]

### =« Blocked Tests

1. **Test Case TC-ZZZ: [Test Name]**
   - **Description**: [What the test validates]
   - **Reason for Block**: [Why test couldn't be completed]
   - **Dependencies**: [What needs to be fixed first]
   - **Impact**: [How this affects overall testing]

## Acceptance Criteria Verification

| Criterion | Status | Notes |
|-----------|--------|-------|
| [Criterion 1 from requirements] |  Pass / L Fail / =« Blocked | [Additional notes] |
| [Criterion 2 from requirements] |  Pass / L Fail / =« Blocked | [Additional notes] |
| [Criterion 3 from requirements] |  Pass / L Fail / =« Blocked | [Additional notes] |
| [Criterion 4 from requirements] |  Pass / L Fail / =« Blocked | [Additional notes] |

## Edge Cases Tested

### Boundary Conditions
- [Edge case 1] -  Handled correctly / L Issue found
- [Edge case 2] -  Handled correctly / L Issue found
- [Edge case 3] -  Handled correctly / L Issue found

### Invalid Inputs
- [Invalid input 1] -  Rejected gracefully / L System error
- [Invalid input 2] -  Rejected gracefully / L System error
- [Invalid input 3] -  Rejected gracefully / L System error

### Empty/Null Values
- [Empty field X] -  Handled correctly / L Issue found
- [Null value Y] -  Handled correctly / L Issue found
- [Missing data Z] -  Handled correctly / L Issue found

### Maximum/Minimum Values
- [Max value test] -  Handled correctly / L Issue found
- [Min value test] -  Handled correctly / L Issue found
- [Over limit test] -  Rejected appropriately / L Issue found

## Performance Testing

### Load Testing
- **Concurrent Users**: [Number tested]
- **Response Times**:
  - Average: [X ms]
  - 95th percentile: [Y ms]
  - Maximum: [Z ms]
- **Throughput**: [Requests per second]
- **Results**:  Acceptable /   Needs improvement / L Poor

### Stress Testing
- **Peak Load**: [Load level tested]
- **System Behavior**: [Description of behavior under stress]
- **Recovery**: [How system recovers after stress]
- **Results**:  Stable /   Some degradation / L System failure

### Memory Usage
- **Baseline**: [Memory usage before feature]
- **With Feature**: [Memory usage with feature]
- **Memory Leaks**: [Any memory leak detected]
- **Results**:  Acceptable /   Monitor / L Issues found

## Integration Testing

### API Integration
- **Endpoint 1**:  Working / L Issues
- **Endpoint 2**:  Working / L Issues
- **Error Handling**:  Proper / L Needs improvement

### Database Integration
- **Read Operations**:  Working / L Issues
- **Write Operations**:  Working / L Issues
- **Transaction Handling**:  Working / L Issues
- **Data Consistency**:  Verified / L Issues found

### Third-party Services
- **Service 1**:  Integrated properly / L Issues
- **Service 2**:  Integrated properly / L Issues
- **Error Handling**:  Graceful / L Problems

## Security Testing

### Input Validation
- **SQL Injection**:  Protected / L Vulnerable
- **XSS**:  Protected / L Vulnerable
- **CSRF**:  Protected / L Vulnerable
- **Authentication**:  Working / L Issues

### Authorization Testing
- **Role-based Access**:  Working / L Issues
- **Permission Checks**:  Working / L Issues
- **Privilege Escalation**:  Not possible / L Vulnerable

## Bugs Found

### Bug #1: [Bug Title]
- **Severity**: Critical/Major/Minor
- **Category**: [Functional/UI/Performance/Security]
- **Description**: [Detailed description of the bug]
- **Steps to Reproduce**:
  1. [Step 1]
  2. [Step 2]
  3. [Step 3]
- **Expected Behavior**: [What should happen]
- **Actual Behavior**: [What actually happens]
- **Frequency**: [Always/Intermittent/Rare]
- **Workaround**: [Any known workaround]
- **Attachments**: [Screenshots, logs, etc.]

### Bug #2: [Bug Title]
- **Severity**: Critical/Major/Minor
- **Category**: [Functional/UI/Performance/Security]
- **Description**: [Detailed description of the bug]
- **Steps to Reproduce**: [Steps]
- **Expected vs Actual**: [Comparison]

## Regression Check

### Existing Features Tested
- [Feature 1] -  Still working / L Regressed
- [Feature 2] -  Still working / L Regressed
- [Feature 3] -  Still working / L Regressed

### Previous Bugs
- [Previous bug 1] -  Still fixed / L Reappeared
- [Previous bug 2] -  Still fixed / L Reappeared

## Usability Testing

### User Experience
- **Ease of Use**: [Rating 1-10] - [Comments]
- **Intuitiveness**: [Rating 1-10] - [Comments]
- **Error Messages**: [Clear/Confusing] - [Examples]
- **Response Feedback**: [Adequate/Insufficient] - [Notes]

### Accessibility
- **Screen Reader**:  Compatible / L Issues
- **Keyboard Navigation**:  Working / L Issues
- **Color Contrast**:  WCAG compliant / L Issues
- **Focus Management**:  Working / L Issues

## Test Coverage Analysis

### Code Coverage (if available)
- **Line Coverage**: [X%]
- **Branch Coverage**: [Y%]
- **Function Coverage**: [Z%]
- **Coverage Goal**: [Target percentage]
- **Gap Analysis**: [Areas not covered]

### Requirement Coverage
- **Total Requirements**: [X]
- **Tested Requirements**: [Y]
- **Coverage Percentage**: [Z%]
- **Untested Requirements**: [List if any]

## Recommendations

### For Development Team
1. [Recommendation 1 - Specific actions needed]
2. [Recommendation 2 - Code improvements]
3. [Recommendation 3 - Additional testing needed]

### For Product Team
1. [Recommendation 1 - Business considerations]
2. [Recommendation 2 - User impact assessment]

### For Future Testing
1. [Recommendation 1 - Test automation opportunities]
2. [Recommendation 2 - Additional test scenarios]

## Overall Assessment

### Quality Summary
- **Functional Quality**: [Excellent/Good/Fair/Poor]
- **Performance Quality**: [Excellent/Good/Fair/Poor]
- **Security Quality**: [Excellent/Good/Fair/Poor]
- **User Experience**: [Excellent/Good/Fair/Poor]

### Release Recommendation
- **Recommendation**:  Ready for release /   Release with fixes / L Not ready for release
- **Blockers**: [Critical issues preventing release]
- **Risks**: [Known risks if released]

## Test Log
[Detailed chronological log of testing activities if needed]

---
**Test Status**: Completed/In Progress/Blocked  
**Tester**: [Tester Agent]  
**Date Started**: [Date]  
**Date Completed**: [Date]  
**Time Spent**: [Duration]  
**Environment**: [Test environment details]