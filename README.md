# CompareLists

An asynchronous, process-blocking array comparison and differential evaluation engine designed to handle quick data validation workflows. The utility uses native OS subsystem lifecycle hooks to suspend shell executions, creating an interactive input buffer inside volatile text editors before performing automated array evaluation and delta extraction.

## 🌟 Technical Architectural Highlights

* **Asynchronous Process-Blocking Intercept:** Leverages localized process state handles to orchestrate user data ingestion. By launching detached text editing streams and monitoring individual process flags (`MainWindowTitle` and file tree locations) inside a managed loop, the shell safely blocks main thread execution until text instances are terminated by the user.
* **Streamlined Pipeline Differential Filtering:** Optimizes comparison operations via a clean filtering pipeline. The engine converts unstructured raw text buffers into cleansed, string-trimmed array elements, then utilizes localized logical exclusion filters (`-notin`) to isolate exact unique delta values between the reference datasets.
* **Volatile System IO Operations:** Manages memory and data footprints efficiently by routing references directly through system environment variables (`$env:TEMP`). This structures operational data into transient scratch files that automatically maintain host disk cleanliness.
* **Immediate System Response Loop:** Triggers an immediate feedback cycle upon data processing, piping extracted array deltas into native system workspace viewfinders to give administrators instant data tracking visibility.

---

## 🛠️ Technology Core

* **Automation Engine:** PowerShell 5.1 / Core
* **Subsystem Orchestration:** Win32 Process Architecture Handlers (`Get-Process`, `Start-Process`)
* **Data Streams & Processing:** Pipeline Array Modifiers, Regulated Polling Hooks (`Start-Sleep`)

---

## 📐 Pipeline & Processing Workflow

1. **Subsystem Workspace Initialization:** Wipes stale runtime traces and spawns target reference text environments inside the host's scratch directories.
2. **Thread Blocking & Lifecycle Observation:** Freezes primary thread execution, executing polling checks every second to determine if external text processing windows are active.
3. **Data Ingestion & Matrix Cleansing:** Reads stored configurations line-by-line, stripping empty space indicators, formatting noise, and dead returns.
4. **Exclusion Assessment:** Validates the arrays against each other to extract individual records found exclusively within the second collection dataset.
5. **Output Routing Execution:** Saves the validated delta elements back onto the local temp tree and immediately opens a fresh terminal instance for instant review.

---

## 🚀 Local Deployment

### Prerequisites
* Operating any standard local PowerShell instance (No external modules required).

### Execution
1. Run the script from your terminal:
   ```powershell
   & .\CompareLists.ps1