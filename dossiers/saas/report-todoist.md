# **The Architecture of Intent: A Deep Exegesis of Todoist**

## **1\. Introduction: The Cognitive Logistics of the Modern Workflow**

In the contemporary knowledge economy, the primary constraint on output is no longer access to information or the capability of tools, but the management of cognitive load. The human brain, while a formidable engine for processing and creativity, acts as a notoriously unreliable storage medium for commitments and temporal obligations. The psychological phenomenon of "open loops"—commitments made by the self that are not securely recorded—generates a background hum of anxiety that degrades executive function. This cognitive friction necessitates the adoption of an "external brain," a digital substrate capable of capturing, organizing, and serving actionable items with higher fidelity than biological memory.  
Among the pantheon of tools designed to address this deficit, Todoist has emerged not merely as a software application but as a distinct philosophical approach to task management. Unlike its competitors that often enforce rigid methodologies or prioritize ornamental aesthetics, Todoist is architected around the principles of **frictionless capture** and **ubiquitous availability**. It operates on the premise that the utility of a task manager is inversely proportional to the time required to input a task. If the interaction cost of recording a thought exceeds a certain threshold—measured in milliseconds and key presses—the user will revert to biological memory, and the system will fail.  
This report conducts a comprehensive exegesis of Todoist, deconstructing its core primitives, analyzing its aesthetic and interaction dynamics, and scrutinizing its technical architecture. It further evaluates the platform’s competitive standing against peers such as Things 3, TickTick, and OmniFocus, isolating the specific "X factors" that constitute its competitive moat. Finally, it explores the upper bounds of the system’s utility for the "wizard-level" power user, particularly in the emerging era of agentic Artificial Intelligence and the Model Context Protocol (MCP).

## **2\. Aesthetic Sensibilities: The Semiotics of Functionalism**

The visual language of Todoist is frequently mischaracterized as merely "minimalist." While it shares superficial traits with minimalism—plentiful whitespace, flat iconography, and a restrained color palette—its design philosophy is more accurately described as **Cognitive Functionalism**. Every pixel in the interface is subordinated to the data it displays; the container is designed to recede so that the content may advance.

### **2.1 The "Crocus" Design System and Native Fluidity**

Todoist’s interface is governed by an internal design system known as **Crocus**. This system faces a unique challenge: maintaining brand identity while adhering to the Human Interface Guidelines (HIG) of Apple, the Material Design standards of Google, and the desktop paradigms of Windows and the Web.1 This is not a trivial aesthetic choice but a strategic one. A user switching from an iPhone to a Windows desktop experiences a shift in interaction patterns—swipes become clicks, sheets become modals—yet the *semantic* language remains identical.  
The application achieves a "native" feel through a deliberate polymorphism. On iOS, task completion is triggered by a haptic-feedback-enabled swipe, respecting the platform's gestural dominance. On the desktop, the interface pivots to a keyboard-centric command line via the Quick Add and Command Palette.3 This adaptability reduces the cognitive friction of context switching; the tool behaves exactly as the user’s muscle memory expects the host operating system to behave, thereby lowering the cognitive load required to operate the tool itself.4

### **2.2 Whitespace as a Navigational Primitive**

In information-dense interfaces, whitespace is often treated as empty canvas. In Todoist, whitespace is an active interface element used to delineate hierarchy and focus. The design avoids heavy borders or skeuomorphic containers (shadows, bevels) that characterize apps like Things 3\. Instead, Todoist relies on **proximity** and **alignment** to group related information.

* **Ink-to-Data Ratio:** The design maximizes the data-ink ratio, a principle championed by Edward Tufte. By removing non-essential gridlines and container boxes, the user’s eye is drawn immediately to the highest-contrast elements: the task text and its associated priority color.5  
* **Semantic Color:** The color palette is strictly utilitarian. Red (the brand color) is used to signal the primary action (Add Task) and the highest level of urgency (Priority 1, Overdue). This reserves the user’s attentional resources for critical signals. A "Priority 4" task, by contrast, is rendered in white or grey, visually receding into the background until specifically queried.6

### **2.3 The Psychology of Gamification: Karma**

An essential, albeit controversial, component of Todoist’s aesthetic is the "Karma" system. This gamification layer visualizes productivity trends through charts and "levels" (from Beginner to Enlightened). While functionalists might dismiss this as ornamental, it serves a critical psychological function: **Retention via Endowed Progress**.  
The visual feedback of the Karma charts provides a dopamine loop that reinforces the habit of capture and completion. For new users, seeing the "Karma Trend" line ascend validates their investment in the system. For long-term users, the fear of breaking a "streak" or losing a "Grandmaster" status creates a powerful lock-in effect, increasing the switching costs relative to non-gamified competitors like Things 3 or OmniFocus.8

## **3\. Deconstructing the Primitives: An Ontology of Work**

To understand Todoist’s power is to understand its data model. The application functions as a relational database disguised as a list. Its utility is derived from a strict ontology of primitives—Tasks, Projects, Sections, Labels, and Filters—that allow users to map complex real-world responsibilities into a digital structure.

### **3.1 The Atomic Unit: The Task**

The fundamental particle of Todoist is the **Task**. Unlike a simple text string, a Todoist task is a rich object containing multiple metadata fields that define its state and relationship to the system.

* **Content:** The actionable description.  
* **Description:** A secondary field for support material (links, notes), separating the "what" from the "how".6  
* **Temporal Metadata:** Due dates and times, which can be fixed (absolute timestamp) or floating (date only).  
* **Priority:** A four-tier hierarchy (P1–P4).  
* **Parent/Child Relationships:** Tasks can contain sub-tasks, allowing for infinite nesting, though the UI encourages shallow hierarchies to prevent "folding fatigue".10

The genius of the Task primitive is its **existential independence**. A task can exist without a project (living in the Inbox), without a date, or without a label. This flexibility allows for the rapid capture of "orphaned" thoughts that can be processed later, aligning perfectly with the "Capture" phase of the Getting Things Done (GTD) methodology.11

### **3.2 The Structural Containers: Projects and Sections**

**Projects** act as the primary silos for tasks, representing distinct outcomes or areas of responsibility.

* **Hierarchical Nesting:** Projects can be nested (e.g., Work \> Marketing \> Q1 Campaign), allowing users to collapse vast swathes of complexity when focus is needed elsewhere.  
* **Sections:** Within a project, Sections introduce a secondary vertical hierarchy. This primitive was a response to the rise of Kanban tools like Trello. By adding Sections, Todoist allows a single project to be viewed as a standard list or as a Kanban board, transforming the primitive from a static container into a workflow visualization tool.6

### **3.3 The Contextual Layer: Labels**

If Projects represent *vertical* organization (where a task belongs), **Labels** represent *horizontal* organization (what a task requires). Labels act as cross-cutting attributes that connect tasks across disparate projects.

* **Many-to-Many Relationship:** A single task can hold multiple labels (e.g., @deep\_work, @computer, @15\_min).  
* **Contextual Filtering:** This primitive is the engine of GTD implementation. A user can query "all tasks requiring a @phone," regardless of whether the call is for a personal doctor’s appointment or a high-stakes business negotiation. This decouples the execution of work from its project categorization.12

### **3.4 The Dynamic View: Filters**

**Filters** are the meta-primitive of Todoist. They are not containers for data but stored queries *of* data. This distinction is critical. A task resides in a Project; it merely *appears* in a Filter.

* **Boolean Logic:** Filters utilize a query syntax that rivals SQL in its specificity. Users can combine logical operators (&, |, \!) with metadata queries.  
  * *Example:* (P1 | P2) & 7 days & @computer &\!\#Shared\_Work  
* **Relative Dates:** The filter engine understands natural language relative dates (due: next week, created: \-3 days), allowing for "rolling window" views that update automatically as time progresses.13

The Filter is the primitive that elevates Todoist from a list manager to a **Personal Resource Planning (PRP)** system. It enables the user to ask the database complex questions about their workload and receive dynamic, real-time answers.

## **4\. Interaction Dynamics: The Flow of Capture**

The "X Factor" that truly differentiates Todoist from its peers is the **velocity of interaction**, specifically the speed at which a thought can be transmuted into a structured task. This is powered by its proprietary Natural Language Processing (NLP) engine, "Quick Add."

### **4.1 The NLP Engine: Reducing Cognitive Activation Energy**

In most task managers, adding a task with a due date, priority, and project requires a sequence of discrete interactions: type name \-\> tab to date field \-\> select date \-\> tab to project \-\> select project. This "form-filling" model imposes a high interaction cost.  
Todoist replaces this with a **single-stream input model**.

* **Input:** Submit report next friday at 2pm \#Work @urgent p1  
* **Parsing:** The engine instantly tokenizes this string:  
  * next friday at 2pm becomes a **Due Date** object.  
  * \#Work becomes a **Project ID**.  
  * @urgent becomes a **Label ID**.  
  * p1 sets the **Priority** flag.15

Crucially, this parsing happens in real-time. As the user types "next fri...", the text highlights, confirming the system's recognition. This visual feedback loop builds trust; the user knows the system has "understood" the intent before they even press enter. This mechanism leverages **chunking**—grouping disparate pieces of information into a single cognitive unit—to minimize the cognitive load associated with context switching.16

### **4.2 Keyboard Mastery and the Command Palette**

For the power user, Todoist offers an interaction model that bypasses the mouse entirely, mimicking the efficiency of a command-line interface (CLI).

* **Global Quick Add (Cmd+Opt+T / Win+Alt+Q):** A system-wide hotkey summons the input bar over any active application. This ensures that capture is never more than a keystroke away, regardless of what the user is doing.  
* **Command Palette (Cmd+K / Ctrl+K):** Inspired by developer tools like VS Code and Sublime Text, the Command Palette allows users to navigate to any project, label, or view by typing a few characters. It also exposes actions like "Sort by priority" or "Switch to board view" without navigating nested menus.3  
* **Contextual Shortcuts:** Within the list view, single-key shortcuts (q to add, a to add below, s to schedule) allow for "twitch-based" task management.

### **4.3 Mobile Ergonomics**

On mobile devices, where typing is slower, Todoist leans on gestural interaction. The **Dynamic Add Button** (on Android) allows users to drag the standard "+" button to a specific location in the list to drop a task exactly where it belongs, combining creation and sorting into a single gesture.15 This attention to platform-specific ergonomics ensures that the "frictionless capture" philosophy is preserved even on constrained interfaces.

## **5\. Technical Architecture: The Sync Engine and Data Consistency**

Beneath the sleek interface lies a robust technical architecture designed for **offline-first consistency**. The sync engine is the unsung hero of Todoist’s reliability.

### **5.1 Incremental Sync and Sync Tokens**

Todoist does not redownload the entire database on every sync. Instead, it utilizes an **incremental sync model**.

* **The Sync Token:** When a client (e.g., an iPhone) requests a sync, it sends its current sync\_token. The server compares this token to the current state and returns only the "delta"—the commands and resources that have changed since that token was issued.18  
* **Bandwidth Efficiency:** This architecture minimizes data transfer, ensuring that syncs are fast even on poor cellular connections, a critical requirement for a ubiquitous mobile tool.

### **5.2 UUIDs and Idempotency**

To handle the chaos of distributed systems (e.g., a user completing a task on a laptop while offline on a phone), Todoist relies on **UUIDs** (Universally Unique Identifiers) for every command.

* **Command Idempotency:** Every action (e.g., item\_close) is tagged with a UUID. If a client sends the same command twice (due to network retry logic), the server recognizes the UUID and ignores the duplicate. This prevents data corruption.18  
* **Temp IDs:** When a user creates a task offline, the client assigns a temp\_id. The user can immediately continue to modify or move this task. Upon reconnection, the server accepts the creation command, assigns a permanent real id, and returns a temp\_id\_mapping to the client, which updates its local database seamlessly. This allows for a completely non-blocking UI.18

### **5.3 Conflict Resolution**

In scenarios of "last-write-wins" or simultaneous edits, Todoist generally privileges the most recent timestamp at the field level. While this can theoretically lead to overwritten data in edge cases, the granular nature of the sync (syncing specific fields rather than whole blobs) minimizes the blast radius of such conflicts.19

## **6\. The Competitive Moat: Why Todoist?**

To articulate Todoist’s "Moat," we must contrast it with its primary peers: **Things 3**, **TickTick**, and **OmniFocus**.

### **6.1 Comparative Feature Matrix**

The following table contrasts Todoist with its key competitors across critical dimensions:

| Feature Dimension | Todoist | Things 3 | TickTick | OmniFocus |
| :---- | :---- | :---- | :---- | :---- |
| **Core Philosophy** | Ubiquitous Capture & NLP | Aesthetic Delight & Simplicity | All-in-One Productivity | GTD Power & Review |
| **Platform Availability** | Universal (Web, Windows, Linux, iOS, Android, Watch) | Apple Ecosystem Only (Mac, iOS, iPad, Vision) | Universal | Apple Ecosystem (Web is limited) |
| **Input Mechanism** | **Best-in-Class NLP** | Drag & Drop / Manual | Good NLP (Parsing variable) | Structured Form Entry |
| **Organization** | Projects, Sections, Labels, Filters | Areas, Projects, Tags | Lists, Tags, Smart Lists | Folders, Projects, Perspectives |
| **Visual Design** | Utilitarian / Functional | Elegant / Skeuomorphic | Dense / Functional | Dense / Enterprise-like |
| **Collaboration** | **Full Multiplayer (Shared Projects)** | None (Single Player) | Limited Sharing | None (Single Player) |
| **Automation** | Python API, REST, Zapier, IFTTT | AppleScript, Shortcuts | Limited | JavaScript Automation |
| **Pricing Model** | Subscription (SaaS) | One-time Purchase | Subscription | Subscription / License |

### **6.2 The X Factor: Platform Agnosticism \+ Frictionless Capture**

While Things 3 dominates in pure aesthetic interaction—offering a "calm" experience with delightful animations—it is trapped within Apple’s walled garden.20 TickTick offers a broader feature set, including a built-in Pomodoro timer and Habit tracker, but its interface is often criticized for feeling cluttered and less polished.21 OmniFocus offers deeper hierarchy and review workflows but imposes a steep learning curve and heavy interaction cost.22  
**Todoist’s X Factor is the combination of:**

1. **Universal Availability:** It runs on effectively every computing platform in existence. A user can capture a task on an Apple Watch, organize it on a Windows PC, and complete it on an Android tablet. This lowers the switching cost for users with hybrid tech stacks.23  
2. **Velocity of Entry:** The NLP engine remains the gold standard. No other app allows for such rapid, accurate, keyboard-only entry of complex metadata.  
3. **Collaborative "Multiplayer":** Todoist creates a network effect. Because it is platform-agnostic, a user can share a grocery list with a partner or a project roadmap with a colleague, regardless of what phone they carry. Things 3 and OmniFocus are strictly "single-player" tools, which severely limits their utility in a collaborative world.24

## **7\. The Wizard’s Leverage: Maximum Utility and Automation**

For the "Wizard" or Power User, Todoist ceases to be a list and becomes a programmable operating system for work.

### **7.1 Advanced Filter Recipes**

The Wizard leverages Boolean logic to create "Dashboards" that filter out noise.

* **The "Deep Work" Dashboard:** (@deep\_work & 60\_min) & (today | overdue) &\!\#Admin &\!@waiting  
  * *Logic:* Show me tasks labeled for deep work that take 60 minutes, are due now, are NOT administrative tasks, and are NOT waiting on others.  
* **The Eisenhower Matrix:**  
  * *Do:* (P1 | @urgent) & @important  
  * *Decide:* \!@urgent & @important  
  * *Delegate:* @urgent &\!@important  
  * *Delete:* \!@urgent &\!@important.7

### **7.2 The API as a Force Multiplier**

Todoist’s API (now v10/REST) is robust enough to support entire cottage industries of extensions.

* **Bi-Directional Sync:** Wizards use scripts to sync GitHub Issues or Jira tickets into Todoist tasks.  
* **Automated Review:** Scripts can query the API to find tasks created \>30 days ago and auto-label them @stale or move them to a "Someday/Maybe" project.26  
* **Integrations:** The Google Calendar 2-way sync is a critical power feature. It allows tasks to exist as time blocks on a calendar. By dragging a task in the calendar, the user updates the due time in Todoist, bridging the gap between "Task Management" (what to do) and "Time Management" (when to do it).27

### **7.3 The New Frontier: Agentic AI and the MCP**

As of 2025, Todoist has integrated the **Model Context Protocol (MCP)**, allowing Large Language Models (LLMs) like Claude or OpenAI’s GPT series to interact directly with the user’s database.

* **Agentic Workflows:** A user can now instruct an AI: *"Review my 'Marketing' project. Identify any tasks due this week that conflict with my 'Vacation' calendar. Reschedule them to next week and add a comment explaining why."*  
* **Mechanism:** The MCP server exposes tools like todoist\_get\_tasks, todoist\_update\_task, and todoist\_add\_comment to the LLM. The LLM reasons about the request, calls the appropriate tools, and executes the changes in the database.29  
* **Leverage:** This moves the user from "managing tasks" to "managing a manager." The AI becomes a tireless executive assistant, capable of grooming the backlog, ensuring data consistency, and even breaking down high-level goals into sub-tasks via the "Task Assist" feature.31

## **8\. Strategic Analysis: The Moat and Future Outlook**

Todoist’s moat is not technological in the sense of a unique algorithm; it is a **Data Gravity** and **Workflow Lock-in** moat.

1. **The Karma Lock-in:** Years of productivity data and "streaks" make leaving emotionally difficult.8  
2. **The Collaborative Lock-in:** Once a user shares projects with family or colleagues, leaving Todoist requires migrating *others*, exponentially increasing the friction of departure.  
3. **The API Ecosystem:** The sheer volume of integrations (IFTTT, Zapier, Google, Slack) means Todoist is often the "default" integration for new tools.

### **8.1 Unsatisfied Requirements and Weaknesses**

Despite its dominance, Todoist has weaknesses:

* **Start/Due Dates:** Unlike Things 3 or OmniFocus, Todoist has historically struggled with the distinction between "Start Dates" (when to see a task) and "Due Dates" (when it must be done). While recent updates have improved this, it remains less rigorous than the "Defer" logic in OmniFocus.32  
* **Sub-task Nuance:** Sub-tasks in Todoist can feel like second-class citizens compared to the true nested hierarchies of OmniFocus. They often clutter filters if not managed carefully.33

### **8.2 Conclusion**

Todoist remains the "Goldilocks" solution of the productivity market. It is simple enough for a novice to use as a grocery list, yet structured enough for a project manager to run a business. Its aesthetic is invisible, its capture is immediate, and its leverage for the power user—through Filters, API, and now Agentic AI—is virtually limitless. It is unequivocally the best at **cross-platform, low-friction capture**, making it the superior choice for the modern, multi-device knowledge worker who values speed and ubiquity above all else.

## **9\. Appendix: Advanced Power User Reference**

### **9.1 Essential Keyboard Shortcuts (Desktop)**

| Action | Shortcut (Mac) | Shortcut (Windows) | Context |
| :---- | :---- | :---- | :---- |
| **Quick Add Task** | Cmd \+ Opt \+ T | Win \+ Alt \+ Q | Global (System-wide) |
| **Command Palette** | Cmd \+ K | Ctrl \+ K | In-App Navigation |
| **Sort Project** | S | S | While in Project |
| **Add Section** | / | / | In Project List |
| **Indent Task** | Cmd \+ Right | Ctrl \+ Right | Task Selection |
| **Postpone Task** | T | T | Task Hover |

### **9.2 The "Wizard" Filter Recipes**

**1\. The "Eat the Frog" (Morning Focus)**  
Query: (today & P1) | (@urgent & overdue)  
*Purpose: Shows only the absolute critical tasks that must be done immediately to prevent consequences.*  
**2\. The "Friday Review" (GTD Weekly Review)**  
Query: (created: \-7 days &\!\#Log) | (@waiting & created: \-14 days)  
*Purpose: Surfaces tasks created recently that may have been missed, and follow-ups that have gone stale.*  
**3\. The "Quick Wins" (Energy Management)**  
Query: (@5min | @10min) &\!@deep\_work & (today | overdue | no date)  
*Purpose: Surfaces small tasks to clear during low-energy periods or small time blocks between meetings.*

#### **Works cited**

1. todoist-ai/docs/tool-design.md at main · Doist/todoist-ai · GitHub, accessed February 14, 2026, [https://github.com/Doist/todoist-ai/blob/main/docs/tool-design.md](https://github.com/Doist/todoist-ai/blob/main/docs/tool-design.md)  
2. Building a Living Design System \- Doist Engineering, accessed February 14, 2026, [https://www.doist.dev/android\_component\_catalog/](https://www.doist.dev/android_component_catalog/)  
3. Use keyboard shortcuts in Todoist, accessed February 14, 2026, [https://www.todoist.com/help/articles/use-keyboard-shortcuts-in-todoist-Wyovn2](https://www.todoist.com/help/articles/use-keyboard-shortcuts-in-todoist-Wyovn2)  
4. A Simple Design and Development Workflow for Building Better Apps \- Todoist, accessed February 14, 2026, [https://www.todoist.com/inspiration/design-development-workflow](https://www.todoist.com/inspiration/design-development-workflow)  
5. The Art of Minimalism in Design | UIUX Media \- Clean Aesthetics, accessed February 14, 2026, [https://uiuxmedia.com/the-art-of-minimalism-in-design/](https://uiuxmedia.com/the-art-of-minimalism-in-design/)  
6. Features | Todoist, accessed February 14, 2026, [https://www.todoist.com/features](https://www.todoist.com/features)  
7. Eisenhower Matrix with Todoist, accessed February 14, 2026, [https://www.todoist.com/help/articles/eisenhower-matrix-with-todoist-kj0Eru](https://www.todoist.com/help/articles/eisenhower-matrix-with-todoist-kj0Eru)  
8. Todoist's Gamification Strategy: A Case Study (2025) \- Trophy, accessed February 14, 2026, [https://trophy.so/blog/todoist-gamification-case-study](https://trophy.so/blog/todoist-gamification-case-study)  
9. Introduction to Karma \- Todoist, accessed February 14, 2026, [https://www.todoist.com/help/articles/introduction-to-karma-OgWkWy](https://www.todoist.com/help/articles/introduction-to-karma-OgWkWy)  
10. Todoist, reviewed. An in-depth analysis of Todoist's… | by Jay Miles | Bootcamp \- Medium, accessed February 14, 2026, [https://medium.com/design-bootcamp/todoist-reviewed-30e951e6de18](https://medium.com/design-bootcamp/todoist-reviewed-30e951e6de18)  
11. Getting Things Done (GTD) with Todoist, accessed February 14, 2026, [https://www.todoist.com/help/articles/getting-things-done-gtd-with-todoist-e5j2h3](https://www.todoist.com/help/articles/getting-things-done-gtd-with-todoist-e5j2h3)  
12. 9 Ways to Use Todoist Labels & Filters to Manage Task List Overwhelm, accessed February 14, 2026, [https://www.todoist.com/inspiration/todoist-labels-filters](https://www.todoist.com/inspiration/todoist-labels-filters)  
13. 24 Todoist Filters to Keep You Super Organized, accessed February 14, 2026, [https://www.todoist.com/inspiration/todoist-filters](https://www.todoist.com/inspiration/todoist-filters)  
14. Introduction to filters \- Todoist, accessed February 14, 2026, [https://www.todoist.com/help/articles/introduction-to-filters-V98wIH](https://www.todoist.com/help/articles/introduction-to-filters-V98wIH)  
15. Use Task Quick Add in Todoist, accessed February 14, 2026, [https://www.todoist.com/help/articles/use-task-quick-add-in-todoist-va4Lhpzz](https://www.todoist.com/help/articles/use-task-quick-add-in-todoist-va4Lhpzz)  
16. Five principles to reduce cognitive load (and how to apply them) | by David R Oliver, accessed February 14, 2026, [https://medium.com/@davidroliver/five-principles-to-reduce-cognitive-load-and-how-to-apply-them-60f78276169d](https://medium.com/@davidroliver/five-principles-to-reduce-cognitive-load-and-how-to-apply-them-60f78276169d)  
17. Hotkey Memory \- Macdrifter, accessed February 14, 2026, [https://www.macdrifter.com/2021/12/hotkey-memory.html](https://www.macdrifter.com/2021/12/hotkey-memory.html)  
18. Overview – Sync API Reference | Todoist Developer, accessed February 14, 2026, [https://developer.todoist.com/sync/v9/](https://developer.todoist.com/sync/v9/)  
19. algorithms \- Conflict resolution for two-way sync \- Software Engineering Stack Exchange, accessed February 14, 2026, [https://softwareengineering.stackexchange.com/questions/153806/conflict-resolution-for-two-way-sync](https://softwareengineering.stackexchange.com/questions/153806/conflict-resolution-for-two-way-sync)  
20. Should I move from things3 to ticktick (or todoist)? \- Reddit, accessed February 14, 2026, [https://www.reddit.com/r/ticktick/comments/1jw797t/should\_i\_move\_from\_things3\_to\_ticktick\_or\_todoist/](https://www.reddit.com/r/ticktick/comments/1jw797t/should_i_move_from_things3_to_ticktick_or_todoist/)  
21. 7 best to do list apps of 2026 \- Zapier, accessed February 14, 2026, [https://zapier.com/blog/best-todo-list-apps/](https://zapier.com/blog/best-todo-list-apps/)  
22. Things vs OmniFocus vs Todoist: A Comparison of the Best GTD and Productivity Apps, accessed February 14, 2026, [https://thesweetsetup.com/articles/comparison-best-gtd-apps-things-todoist-omnifocus/](https://thesweetsetup.com/articles/comparison-best-gtd-apps-things-todoist-omnifocus/)  
23. Todoist vs Things 3 vs Zero-Friction Tasks: Best Todo App Comparison 2024, accessed February 14, 2026, [https://zerofriction.app/blog/todoist-things-0f-comparison](https://zerofriction.app/blog/todoist-things-0f-comparison)  
24. TickTick vs Todoist vs Things 3 2025 — Which To Do App Actually Makes You Productive?, accessed February 14, 2026, [https://www.youtube.com/watch?v=AOyq2ZcyBOI](https://www.youtube.com/watch?v=AOyq2ZcyBOI)  
25. Eisenhower Matrix in Todoist \- Medium, accessed February 14, 2026, [https://medium.com/modern-recipes/eisenhower-matrix-in-todoist-7d99ebceb795](https://medium.com/modern-recipes/eisenhower-matrix-in-todoist-7d99ebceb795)  
26. What have you used the Todoist API for? \- Reddit, accessed February 14, 2026, [https://www.reddit.com/r/todoist/comments/uniieh/what\_have\_you\_used\_the\_todoist\_api\_for/](https://www.reddit.com/r/todoist/comments/uniieh/what_have_you_used_the_todoist_api_for/)  
27. Use the Calendar integration \- Todoist, accessed February 14, 2026, [https://www.todoist.com/help/articles/use-the-calendar-integration-rCqwLCt3G](https://www.todoist.com/help/articles/use-the-calendar-integration-rCqwLCt3G)  
28. You can try the legacy 2-way Google Calendar integration here. : r/todoist \- Reddit, accessed February 14, 2026, [https://www.reddit.com/r/todoist/comments/1m2289k/you\_can\_try\_the\_legacy\_2way\_google\_calendar/](https://www.reddit.com/r/todoist/comments/1m2289k/you_can_try_the_legacy_2way_google_calendar/)  
29. Todoist MCP Server \- LobeHub, accessed February 14, 2026, [https://lobehub.com/mcp/greirson-mcp-todoist](https://lobehub.com/mcp/greirson-mcp-todoist)  
30. Connect Todoist to Your LLMs \- MCP Market, accessed February 14, 2026, [https://mcpmarket.com/server/todoist-2](https://mcpmarket.com/server/todoist-2)  
31. Introduction to Todoist Assist, accessed February 14, 2026, [https://www.todoist.com/help/articles/introduction-to-todoist-assist-KgPP22q5O](https://www.todoist.com/help/articles/introduction-to-todoist-assist-KgPP22q5O)  
32. Top 10 Todoist Alternatives for Daily Task Management in 2025 \- Plaky, accessed February 14, 2026, [https://plaky.com/blog/todoist-alternatives/](https://plaky.com/blog/todoist-alternatives/)  
33. Are you happy with moving from Things 3 to Todoist? : r/thingsapp \- Reddit, accessed February 14, 2026, [https://www.reddit.com/r/thingsapp/comments/1jla3ha/are\_you\_happy\_with\_moving\_from\_things\_3\_to\_todoist/](https://www.reddit.com/r/thingsapp/comments/1jla3ha/are_you_happy_with_moving_from_things_3_to_todoist/)