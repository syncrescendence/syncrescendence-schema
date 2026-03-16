# **The Ontology of Enterprise Work: An Architectural Exegesis of Jira**

## **I. Introduction: The Operating System of Work**

To characterize Jira merely as a project management tool or an issue tracker is to commit a category error. While its surface utility lies in tracking tasks, bugs, and user stories, its architectural essence is that of a programmable relational database wrapped in a finite state machine (FSM), governed by a granular permission topology. It acts not just as a repository of work but as the **Operating System of Enterprise Work**—a meta-platform upon which organizational reality is modeled, constrained, and executed.  
In the landscape of digital work management, tools generally fall into two philosophical camps: the "Opinionated" and the "Agnostic." Opinionated tools, such as Linear or Basecamp, enforce a specific methodology (e.g., the "Linear Method" or strict Scrum), prioritizing velocity and cognitive ease by restricting user choice. They posit that the tool creators know the optimal way to work. Jira, conversely, represents the Agnostic extreme. It presents a "blank canvas" of state management, assuming that the organization’s processes are unique, complex, and irreducible to a standard template. This architectural decision results in high initial entropy and a steep learning curve, but it grants Jira the unique capability to model the chaotic, matrixed reality of large-scale enterprises.1  
This report conducts a deep exegesis of Jira’s primitives—the atomic units of its architecture. We will dismantle its aesthetic sensibilities, which favor information density over minimalism, and analyze the interaction dynamics that result from its "Constraint via Configuration" philosophy. Furthermore, we will scrutinize the "Wizard" or power-user leverage provided by its scripting layers (ScriptRunner) and the massive ecosystem that constitutes its economic moat. Ultimately, we seek to answer the strategic question: In an era of lightweight, high-speed competitors, why does Jira remain the unassailable X-factor for the enterprise?

## **II. The Primitives of State and Structure**

Understanding Jira requires dismantling its object model. The system is built upon a set of interacting primitives that separate data storage, process logic, and presentation layers. This separation of concerns—reminiscent of the Model-View-Controller (MVC) software pattern—is the source of both its complexity and its flexibility.

### **2.1 The Issue: The Atomic Unit of Identity**

The fundamental particle of the Jira universe is the **Issue**. While users may colloquially refer to them as "tickets," "cards," or "bugs," architecturally, an Issue is a polymorphic data container. Unlike a row in a spreadsheet or a document in a NoSQL store, a Jira Issue possesses specific properties that define its existence within the system.3

#### **2.1.1 Identity and Immutability**

Every Issue is assigned a unique, immutable key composed of a Project Key and a sequential number (e.g., PROJ-123). This key serves as the primary identifier across the entire ecosystem, persisting even if the issue is moved, renamed, or fundamentally altered in scope. This persistence of identity allows the Issue to serve as a reliable anchor point for the "Teamwork Graph"—linking code commits, wiki pages, design files, and Slack conversations to a single source of truth.5

#### **2.1.2 Polymorphism via Issue Types**

The Issue is polymorphic. Through the mechanism of **Issue Types**, the same underlying data structure can represent radically different business entities.

* **Standard Types:** Bug, Story, Task.  
* **Business Types:** Candidate (HR), Asset (ITSM), Contract (Legal), Risk (Compliance).

The "Issue Type" is not merely a label; it is a schema definition. It dictates which Fields are associated with the object, which Workflow governs its lifecycle, and which Screen Scheme renders its interface.3 This allows a single Jira instance to host a software development project alongside a procurement tracking system, with each "Issue" behaving according to completely different logic rules while sharing the same database infrastructure.

### **2.2 The Project: The Scope of Configuration**

If the Issue is the atom, the **Project** is the containment field. A Project in Jira is not simply a folder of tasks; it is a **configuration scope**. It defines the "laws of physics" for the Issues contained within it.4  
In many competitor tools, a project is a transient grouping of tasks. In Jira, a Project is an administrative boundary that binds specific Schemes (Permission, Notification, Workflow, Screen) to a set of Issues. This architecture allows for the coexistence of heterogeneous work styles. A "Support" project can enforce strict Service Level Agreements (SLAs) and mandatory field data, while an adjacent "Innovation" project can operate with a loose Kanban workflow and minimal required fields. The Project primitive enables the "matrix" organization, where different departments (Legal, Dev, HR) operate in their own silos of process while residing on a unified platform.6

### **2.3 The Field: The Data Attribute**

Jira’s data flexibility stems from its **Field** architecture.

* **System Fields:** Hardcoded attributes essential for the system’s logic (e.g., Summary, Description, Assignee, Reporter, Priority, Resolution).3  
* **Custom Fields:** User-defined attributes that allow the Issue to model specific domain data (e.g., "Customer Tier," "Root Cause," "Budget Code").

The interaction dynamics of Fields are governed by **Field Configurations**. These configurations dictate the behavior of a field within a specific context—whether it is required, hidden, or visible, and how it renders (e.g., rich text vs. plain text).8 This capability allows administrators to enforce data hygiene at the schema level. For example, a "Bug" issue type might mandate a "Steps to Reproduce" field, while a "Task" issue type hides it entirely.

### **2.4 The Screen: The Presentation Layer**

One of Jira’s most distinctive—and often confusing—architectural choices is the decoupling of data storage (Fields) from data presentation (**Screens**).3  
In most modern SaaS tools, if a field exists on an object, it is visible in the interface. Jira rejects this simplicity in favor of context-specificity. A **Screen** is an ordered collection of fields. A **Screen Scheme** then maps these screens to specific **Issue Operations**:

* **Create Operation:** Might use a "Simplified Screen" with only essential fields to reduce friction during entry.  
* **View Operation:** Uses a "Full Screen" to show all relevant data.  
* **Edit Operation:** Might use a different subset of fields.

**Strategic Implication:** This indirection layer allows for the curation of the user experience based on the *action* being performed. It prevents information overload during the creation phase while ensuring exhaustive detail is available during the review phase. However, it significantly increases the administrative burden, as adding a new field often requires touching multiple configuration artifacts (The Field itself, the Screen, the Screen Scheme).9

### **2.5 The Scheme: The Indirection Layer**

The "Scheme" is perhaps the most misunderstood primitive in Jira. Architecturally, a Scheme is a reusable mapping object—a pointer system.

* **Permission Scheme:** Maps Roles/Groups to Permissions.  
* **Notification Scheme:** Maps Events to Recipients.  
* **Workflow Scheme:** Maps Issue Types to Workflows.

**The "Why" of Schemes:** Schemes exist to solve the problem of scale. In an enterprise with 5,000 projects, configuring permissions individually for each project is untenable. Instead, an administrator creates a single "Standard Development Permission Scheme" and applies it to 4,900 projects. If the governance policy changes (e.g., "Interns can no longer delete comments"), the admin updates the *Scheme* once, and the change propagates instantly to all 4,900 associated projects.4 This architecture favors initial complexity for the sake of long-term maintainability and massive scalability.

## **III. The Kinetic Primitives: Workflows and Logic**

If the primitives above define the *state* of work, the **Workflow** defines its *kinetics*—how it moves through time and process. Jira’s workflow engine is a robust implementation of a **Finite State Machine (FSM)**.

### **3.1 The Finite State Machine (FSM)**

At its core, a Jira workflow is a directed graph where:

* **Nodes (Statuses):** Represent the resting state of an Issue (e.g., "To Do," "In Progress," "Under Review").6  
* **Edges (Transitions):** Represent the allowed movement between states.6

Unlike tools that treat status as a simple drop-down property (e.g., changing a cell in a spreadsheet), Jira treats status changes as **Transactions**. An issue cannot simply "be" in a new status; it must "transition" there. This distinction is critical because the Transition is an executable object that can hold logic.

### **3.2 The Transition: The Execution Hook**

The **Transition** is the most powerful primitive in the Jira logic engine. It is not just a path; it is a container for logic gates and automation triggers. A Transition is composed of three logic layers that execute sequentially 6:

| Logic Layer | Function | Example |
| :---- | :---- | :---- |
| **1\. Conditions** | **Gating:** Determines *who* can see and execute the transition. If the condition fails, the button to move the issue is invisible. | "Only the Reporter can execute the 'Close' transition." "Only users in the 'QA Group' can move to 'Passed'." |
| **2\. Validators** | **Input Check:** Checks the state of the data *before* the transition completes. If validation fails, the transition is aborted and an error is shown. | "The 'Fix Version' field must be set." "The 'Time Spent' must be greater than zero." |
| **3\. Post-Functions** | **Execution:** Actions that occur *after* the transition succeeds. | "Update the 'Resolution' field to 'Fixed'." "Fire a webhook to Slack." "Re-assign to the Project Lead." |

**Second-Order Insight:** This structure transforms Jira from a passive tracking tool into a **Process Enforcement Engine**. Organizations use Transitions to encode their compliance rules directly into the substrate of the work. For example, a financial institution can cryptographically guarantee that code cannot move to production (Status: Deployed) without passing through a "Security Review" status, enforced by a Validator that checks for a specific approval signature. This level of governance is the "moat" that prevents regulated industries from switching to lighter tools.11

### **3.3 Statuses vs. Resolutions**

A common ontological confusion in Jira is the distinction between **Status** and **Resolution**.

* **Status:** Where the issue is *now* (e.g., Closed).  
* **Resolution:** Why the issue is effectively *dead* (e.g., Fixed, Won't Do, Duplicate, Cannot Reproduce).6

This distinction allows for accurate reporting on "Velocity." An issue moved to "Done" with a resolution of "Duplicate" represents zero value delivered, whereas "Done" with "Fixed" represents value. Simple tools often conflate these, leading to distorted metrics.

## **IV. Aesthetic Sensibilities and Interaction Dynamics**

Jira’s design philosophy stands in stark contrast to the current trend of "invisible" or "minimalist" software. It embraces a **"Cockpit"** aesthetic—dense, control-heavy, and explicit.

### **4.1 The Cockpit vs. The Flow**

Jira’s User Experience (UX) can be analyzed through the metaphor of a pilot’s cockpit.

* **Information Density:** The Issue View is intentionally dense. It presents a centralized dashboard of the issue’s state, metadata (fields), relationships (links), and history (audit log).9 The aesthetic goal is **comprehensiveness**. A user should not have to navigate away to find the context; the "Sidebar" navigation and multi-column layout provide a "bird's-eye view" of the project.12  
* **Visual Hierarchy:** The Atlassian Design System (ADS) utilizes specific primitives like **Lozenges** (colored pills for status/priority) and **Avatars** to create visual anchors in this sea of text.13 Recent updates have introduced a "cohesive scale" of typography and "bolder headings" to improve scan-ability, acknowledging that the sheer volume of data can be overwhelming.14

Contrast this with **Linear**, which embodies the **"Flow"** aesthetic.

* **Minimalism:** Linear hides metadata until requested. It prioritizes the text of the work (Title/Description) over the metadata of the process.15  
* **Interaction Speed:** Linear is built for sub-50ms latency, utilizing optimistic UI updates where the interface assumes success before the server confirms.16 Jira, with its complex server-side validation logic (see Transitions), often requires a round-trip to the server to confirm a state change, creating an inherent feeling of "friction" or "sluggishness."

**Insight:** This friction in Jira is often a *feature*, not a bug, in enterprise contexts. The "Save" button or the "Transition Screen" modal forces a moment of conscious deliberation ("Am I sure this is ready for QA?"), whereas the frictionless drag-and-drop of Linear prioritizes velocity over verification.

### **4.2 Interaction Dynamics: Modality and Indirection**

Jira’s interaction model is heavily **modal**.

* **Transition Screens:** When a user moves an issue, a modal dialog often appears (the "Transition Screen") asking for specific fields required for that state change (e.g., "Please enter the Resolution code").3  
* **Inline Editing vs. Explicit Edit:** While Jira supports inline editing, the "Edit" button opens a distinct modal. This supports the complexity of Screen Schemes—the fields available for "Edit" might differ from those available for "View."

This modality reinforces the **Ontology of Constraint**. The system interrupts the user’s flow to demand data hygiene. For a developer, this is annoying (high cognitive load). For a Project Manager or Compliance Officer, this is essential (high data integrity).17

### **4.3 The Atlassian Design System (ADS)**

The ADS provides the "glue" that holds this complex interface together. It emphasizes "Harmonious" and "Foundational" values over "Infinite Flexibility".13

* **Constraint via Design:** The system rejects the ability for every team to style their own boards arbitrarily. Instead, it enforces a unified visual language (standardized tokens for spacing, color, and type) to ensure that a developer moving from a Jira Software project to a Jira Service Management queue experiences a consistent cognitive environment.13  
* **Primitives:** Components like the "Box," "Stack," and "Inline" are the layout primitives used to construct the UI, ensuring responsive behavior across devices, though the mobile experience remains a "scaled-down" version of the desktop cockpit rather than a native-first reimplementation.19

## **V. The Power User’s Leverage: Scripting and Automation**

For the "Wizard" or Power User, Jira is not a static tool but a **Development Environment (IDE)**. The maximum leverage is achieved by bypassing the GUI and interacting directly with the logic engine.

### **5.1 The Logic Tiers: Low-Code vs. Code**

Jira offers a tiered automation architecture:

1. **Automation for Jira (A4J):** The no-code logic engine.  
2. **ScriptRunner:** The code-based logic engine (Groovy).

#### **5.1.1 Automation for Jira (A4J)**

A4J democratizes logic via a visual block builder ("If This, Then That"). It creates a "Logic Layer" accessible to Project Admins.

* **Smart Values:** A pseudo-code syntax (Mustache-style) used to access issue data dynamically.  
  * *Example:* {{issue.summary.match(".\*(lo).\*")}} uses Regex to extract data from a summary.21  
  * *Logic:* It supports branching ("If/Else") and iteration ("For Each Subtask").  
* **Limitations:** A4J operates primarily asynchronously and has strict service limits (e.g., throttle limits on loop executions to prevent performance degradation).22 It cannot easily interrupt a transaction in real-time to block a user action based on complex logic.24

#### **5.1.2 ScriptRunner: The Nuclear Option**

**ScriptRunner** represents the apex of power user leverage. It allows the injection of **Groovy scripts** directly into the Jira Java Virtual Machine (JVM) context (in Data Center) or via an enhanced API wrapper (in Cloud).25

| Feature | Automation for Jira (A4J) | ScriptRunner (Groovy) |
| :---- | :---- | :---- |
| **Paradigm** | Visual / No-Code | Scripting / Code |
| **Execution Context** | Asynchronous (Event-Driven) | Synchronous & Asynchronous |
| **Access Level** | JSON Payload / Smart Values | Full Java Object Model (User, Issue, Context) |
| **UX Manipulation** | None (Backend only) | **Behaviours:** Real-time client-side logic |
| **Complexity** | Low | High (Requires Dev Skills) |

**The "Behaviours" Primitive:**  
ScriptRunner introduces a primitive called **Behaviours** that A4J lacks. This allows for *client-side* logic.

* *Scenario:* A user selects "Hardware" in a "Category" dropdown.  
* *Behaviour Logic:* Immediately (without page reload) makes the "Serial Number" field visible and mandatory, while hiding the "Software Version" field.25  
* *Leverage:* This transforms the "Create Issue" screen from a static form into a **dynamic application**, dramatically reducing data entry errors and cognitive load.

**Recursive Graph Queries:**  
Power users leverage ScriptRunner to extend **JQL** (Jira Query Language). Standard JQL is flat (e.g., project \= X). ScriptRunner JQL is hierarchical and recursive.

* *Query:* issueFunction in linkedIssuesOfRecursive("is blocked by")  
* *Power:* This allows a program manager to identify the "Critical Path" of a project by traversing the dependency graph to infinite depth, identifying every issue that eventually blocks a key milestone.26

### **5.2 Advanced JQL: The SQL of Work**

JQL is the query language that underpins all reporting in Jira. While simple users filter by status, power users query by **History** and **Topology**.

* **Historical Analysis:** Operators like WAS and CHANGED allow analysis of process health.  
  * *Query:* status WAS "In Progress" BY currentUser() AFTER startOfWeek()  
  * *Insight:* This reconstructs the narrative of work, allowing managers to see not just what *is* done, but *how* it was done (e.g., "Show me issues that were reopened three times").27  
* **Teamwork Graph Integration:** The future of JQL involves querying the **Teamwork Graph**, enabling queries that span tools: "Show me Jira issues linked to Confluence pages created by the Marketing team".5

## **VI. The Ecosystem and The Enterprise Moat**

Jira’s dominance is not solely a product of its features; it is a product of its **Ecosystem**. This ecosystem creates a defensive "Moat" that renders competitors economically and functionally inviable for large enterprises.

### **6.1 The Marketplace Economy**

The Atlassian Marketplace has generated over **$4 billion in lifetime sales**.28 This is not just an app store; it is a secondary economy of feature development.

* **The "Missing Feature" Strategy:** When Jira lacks a feature (e.g., Test Case Management, Resource Planning, Timesheets), Atlassian does not build it; they rely on partners (e.g., Zephyr, Tempo, BigPicture).  
* **Vendor Lock-In:** An enterprise does not just "buy Jira." They buy a stack: "Jira \+ BigPicture \+ ScriptRunner." To migrate away from Jira, the enterprise must find a replacement not just for the core tracker, but for the embedded ERP, HRM, and QA systems built on top of it. This creates immense **Switching Costs**.28

### **6.2 Compliance as a Feature**

For the Fortune 2000 and Government sectors, "User Experience" is secondary to "Governance."

* **FedRAMP & HIPAA:** Jira (Cloud and Data Center) supports FedRAMP Moderate and HIPAA compliance.11 This certification is a binary gatekeeper. A cool startup tool like Linear cannot be legally used by a Defense Contractor or a Hospital if it lacks these certifications.  
* **Audit Trails:** The immutability of Jira’s history—tracking every field change, transition, and permission check—satisfies the rigorous audit requirements of SOX (Sarbanes-Oxley) and GDPR.

### **6.3 The "One Jira" Unification and Teamwork Graph**

Atlassian’s 2024-2025 strategy focuses on the "X-Factor" of **Unification**.

* **Merging Architectures:** The unification of Jira Software (Agile) and Jira Work Management (Business) into a single "Jira" removes the silos between technical and non-technical teams.10  
* **The Cross-Functional Graph:** This creates a unified dependency graph. A marketing launch task (Jira Work Management) can be explicitly linked to a software release ticket (Jira Software). If the code is delayed, the marketing launch is automatically flagged as "at risk." This **isomorphic mapping** of the entire organizational dependency tree is the "God View" that fragmented toolchains cannot provide.10

## **VII. Comparative Analysis: The Strategic Choice**

### **7.1 Jira vs. Linear: A Philosophical Divergence**

The comparison between Jira and Linear is not functional; it is philosophical.

| Feature | Jira | Linear |
| :---- | :---- | :---- |
| **Ontology** | **Agnostic:** "Work is whatever you define it to be." | **Opinionated:** "Work is software development." |
| **Process** | **Configuration:** You build the machine. | **Convention:** You use the machine. |
| **Target User** | **The Organization:** PMOs, CIOs, Compliance. | **The Practitioner:** Developers, Designers. |
| **Aesthetics** | **Cockpit:** High density, high control, modality. | **Flow:** Low density, high velocity, optimistic UI. |
| **Latency** | **Server-Authoritative:** Slower, strictly validated. | **Local-First:** Instant, eventually consistent. |
| **Scope** | **Universal:** HR, Legal, Dev, Ops. | **Specialized:** Product & Engineering. |

**The "Brutally Honest" Reality:** Teams often prefer Linear for its speed ("Team velocity feels better"), but management prefers Jira for its reporting and governance ("Missing advanced reporting"). The friction in Jira is the cost of the data density required by the enterprise.16

### **7.2 The X-Factor: Why Choose Jira?**

The **X-Factor** of Jira is its **Plasticity at Scale**.

1. **For the Architect (CTO/CIO):** Jira is the only platform that allows you to model the *entire* business—not just the code—in a single relational system. It enables the **Teamwork Graph**, connecting the "Who" (Users), "What" (Issues), "How" (Workflows), and "Where" (Code/Docs) into a queryable dataset.29  
2. **For the Manager:** It offers **Governance**. The ability to enforce process (via Workflow Validators) and restrict access (via Security Schemes) protects the organization from risk.  
3. **For the Power User:** It offers **Programmability**. Through ScriptRunner and the API, Jira is not software you *use*; it is software you *program*.

### **7.3 Maximum Leverage**

The maximum leverage in Jira is achieved when it is treated as an **Enterprise Operating System**.

* **Level 1 (User):** Tracking tasks.  
* **Level 2 (Admin):** Configuring Workflows and Schemes to match business process.  
* **Level 3 (Wizard):** Using ScriptRunner and API integrations to automate the *logic* of the business—auto-calculating risk, enforcing regulatory compliance via code, and integrating the Teamwork Graph to make the organization transparent and queryable.

## **Conclusion: The Canvas of Complexity**

Jira’s complexity is a mirror of the complexity of the enterprises it serves. Its primitives—the Issue, the Workflow, the Scheme—are designed not for simplicity, but for **robustness** and **extensibility**. While the "Cockpit" aesthetic demands a higher cognitive load than the "Flow" of its competitors, this density is the necessary interface for a system that manages not just tasks, but the intricate web of dependencies, permissions, and compliance rules that define modern work.  
The "Moat" is built on the triad of **Ecosystem** (Marketplace), **Compliance** (FedRAMP), and **Scale** (Data Center/Cloud). For a startup, Jira is often overkill—a heavy suit of armor when a t-shirt would suffice. But for the scaling enterprise, facing the chaos of thousands of employees and regulatory scrutiny, Jira provides the necessary structure—the steel frame upon which the skyscraper of the organization is built. It is the blank canvas of enterprise reality, waiting to be configured.

#### **Works cited**

1. Jira vs Azure DevOps \- Atlassian, accessed February 14, 2026, [https://www.atlassian.com/software/jira/comparison/jira-vs-azure-devops](https://www.atlassian.com/software/jira/comparison/jira-vs-azure-devops)  
2. jira vs. trello vs. confluence vs. asana vs. azure devops vs. monday \- Ritza Articles, accessed February 14, 2026, [https://ritza.co/articles/gen-articles/jira-vs-trello-vs-confluence-vs-asana-vs-azure-devops-vs-monday/](https://ritza.co/articles/gen-articles/jira-vs-trello-vs-confluence-vs-asana-vs-azure-devops-vs-monday/)  
3. Project screens, schemes and fields | Administering Jira applications ..., accessed February 14, 2026, [https://confluence.atlassian.com/spaces/ADMINJIRASERVER100/pages/1442845437/Project+screens+schemes+and+fields](https://confluence.atlassian.com/spaces/ADMINJIRASERVER100/pages/1442845437/Project+screens+schemes+and+fields)  
4. Project screens, schemes and fields | Administering Jira applications Data Center 11.3, accessed February 14, 2026, [https://confluence.atlassian.com/adminjiraserver/project-screens-schemes-and-fields-938847220.html](https://confluence.atlassian.com/adminjiraserver/project-screens-schemes-and-fields-938847220.html)  
5. What is Teamwork Graph \- Developer, Atlassian, accessed February 14, 2026, [https://developer.atlassian.com/platform/teamwork-graph/what-is-teamwork-graph/](https://developer.atlassian.com/platform/teamwork-graph/what-is-teamwork-graph/)  
6. Introduction to Jira Workflows | Atlassian, accessed February 14, 2026, [https://www.atlassian.com/software/jira/guides/workflows/overview](https://www.atlassian.com/software/jira/guides/workflows/overview)  
7. Configuring workflow schemes | Administering Jira applications Data Center 11.3, accessed February 14, 2026, [https://confluence.atlassian.com/adminjiraserver/configuring-workflow-schemes-938847421.html](https://confluence.atlassian.com/adminjiraserver/configuring-workflow-schemes-938847421.html)  
8. Defining a screen | Administering Jira applications Data Center 11.3 | Atlassian Documentation, accessed February 14, 2026, [https://confluence.atlassian.com/adminjiraserver/defining-a-screen-938847288.html](https://confluence.atlassian.com/adminjiraserver/defining-a-screen-938847288.html)  
9. Configuring the issue view | Jira Software Data Center 11.3 ..., accessed February 14, 2026, [https://confluence.atlassian.com/jirasoftwareserver/configuring-the-issue-view-938845334.html](https://confluence.atlassian.com/jirasoftwareserver/configuring-the-issue-view-938845334.html)  
10. Welcome to the next era of Jira \- Work Life by Atlassian, accessed February 14, 2026, [https://www.atlassian.com/blog/announcements/the-next-era-of-jira](https://www.atlassian.com/blog/announcements/the-next-era-of-jira)  
11. FedRAMP | Atlassian, accessed February 14, 2026, [https://www.atlassian.com/trust/compliance/resources/fedramp](https://www.atlassian.com/trust/compliance/resources/fedramp)  
12. Designing Atlassian's new navigation \- Work Life by Atlassian, accessed February 14, 2026, [https://www.atlassian.com/blog/design/designing-atlassians-new-navigation](https://www.atlassian.com/blog/design/designing-atlassians-new-navigation)  
13. Overview \- About atlassian design system \- Atlassian Design, accessed February 14, 2026, [https://atlassian.design/get-started/about-atlassian-design-system](https://atlassian.design/get-started/about-atlassian-design-system)  
14. A visual refresh of our UI foundations is coming \- The Atlassian Developer Community, accessed February 14, 2026, [https://community.developer.atlassian.com/t/a-visual-refresh-of-our-ui-foundations-is-coming/84949](https://community.developer.atlassian.com/t/a-visual-refresh-of-our-ui-foundations-is-coming/84949)  
15. Linear vs Jira \- Which Project Tool Fits Your Team \- Siit, accessed February 14, 2026, [https://www.siit.io/tools/comparison/linear-vs-jira](https://www.siit.io/tools/comparison/linear-vs-jira)  
16. Linear vs. Jira (2025): Why Startups Are Switching | by Chris shoff \- Medium, accessed February 14, 2026, [https://medium.com/@chrisshoff2026/linear-vs-jira-2025-why-startups-are-switching-15d60e1abfc1](https://medium.com/@chrisshoff2026/linear-vs-jira-2025-why-startups-are-switching-15d60e1abfc1)  
17. Been using Linear for 6 months vs Jira \- here's my brutally honest ..., accessed February 14, 2026, [https://www.reddit.com/r/ProductManagement/comments/1neyq6j/been\_using\_linear\_for\_6\_months\_vs\_jira\_heres\_my/](https://www.reddit.com/r/ProductManagement/comments/1neyq6j/been_using_linear_for_6_months_vs_jira_heres_my/)  
18. Overview \- Atlassians \- Atlassian Design, accessed February 14, 2026, [https://atlassian.design/get-started/design](https://atlassian.design/get-started/design)  
19. Overview \- Components \- Atlassian Design System, accessed February 14, 2026, [https://atlassian.design/components](https://atlassian.design/components)  
20. Linear vs Jira: de grootste verschillen & beste keuze (2026) \- ToolGuide, accessed February 14, 2026, [https://toolguide.io/en/compare/linear-vs-jira/](https://toolguide.io/en/compare/linear-vs-jira/)  
21. Automation smart values \- text fields \- Atlassian Support, accessed February 14, 2026, [https://support.atlassian.com/cloud-automation/docs/jira-smart-values-text-fields/](https://support.atlassian.com/cloud-automation/docs/jira-smart-values-text-fields/)  
22. Automation service limits \- Atlassian Support, accessed February 14, 2026, [https://support.atlassian.com/cloud-automation/docs/automation-service-limits/](https://support.atlassian.com/cloud-automation/docs/automation-service-limits/)  
23. Automation Loop limitation \- Atlassian Community, accessed February 14, 2026, [https://community.atlassian.com/forums/Automation-questions/Automation-Loop-limitation/qaq-p/2733044](https://community.atlassian.com/forums/Automation-questions/Automation-Loop-limitation/qaq-p/2733044)  
24. When should you choose Jira Automation vs ScriptRu..., accessed February 14, 2026, [https://community.atlassian.com/forums/Advanced-planning-questions/When-should-you-choose-Jira-Automation-vs-ScriptRunner/qaq-p/3182281](https://community.atlassian.com/forums/Advanced-planning-questions/When-should-you-choose-Jira-Automation-vs-ScriptRunner/qaq-p/3182281)  
25. How ScriptRunner goes beyond native Jira automations, accessed February 14, 2026, [https://www.scriptrunnerhq.com/locker/jira-automation-compared-with-scriptrunner-for-jira-cloud](https://www.scriptrunnerhq.com/locker/jira-automation-compared-with-scriptrunner-for-jira-cloud)  
26. ScriptRunner Enhanced search with Jira Automation \- Atlassian Community, accessed February 14, 2026, [https://community.atlassian.com/forums/Jira-questions/ScriptRunner-Enhanced-search-with-Jira-Automation/qaq-p/2411050](https://community.atlassian.com/forums/Jira-questions/ScriptRunner-Enhanced-search-with-Jira-Automation/qaq-p/2411050)  
27. Advanced searching \- functions reference | Jira Software Data Center 11.3, accessed February 14, 2026, [https://confluence.atlassian.com/spaces/JIRASOFTWARESERVER/pages/939938746/Advanced+searching+-+functions+reference](https://confluence.atlassian.com/spaces/JIRASOFTWARESERVER/pages/939938746/Advanced+searching+-+functions+reference)  
28. How Atlassian Scaled Its Marketplace to a $10B Ecosystem \- Getint, accessed February 14, 2026, [https://www.getint.io/blog/atlassian-marketplace-how-to-scale-a-platform-and-ecosystem-to-10b](https://www.getint.io/blog/atlassian-marketplace-how-to-scale-a-platform-and-ecosystem-to-10b)  
29. Connecting to Teamwork Graph \- Developer, Atlassian, accessed February 14, 2026, [https://developer.atlassian.com/platform/teamwork-graph/](https://developer.atlassian.com/platform/teamwork-graph/)