# DRAFT-METHOD-SPECIFICATION-PRODUCTION.md

**Class:** Method (draft — not ratified grammar-layer canon)  
**Status:** Draft working procedure, sufficient for first REVIEW-governed invocation. Subject to refinement after proving. Does not amend METHOD-ENGINE.md or any grammar-layer document.  
**Scope:** Extracting prescriptive content from accepted descriptive scaffolds (surface scaffolds, layer scaffolds) to produce specification-class artifacts.  
**Governance:** REVIEW for all invocations until the method reaches Level 2.  

---

## Purpose

Specification production converts descriptive substrate (what exists and how it works) into prescriptive artifacts (what the institution should do and why). The descriptive scaffold system deliberately extracts and quarantines prescriptive content; specification production is the governed channel through which that quarantined content — plus structural analysis derived from the scaffolds — re-enters the artifact system as lawful prescription.

## Input Requirements

1. At least one accepted layer scaffold for the target modality class.
2. Accepted surface scaffolds providing per-surface evidence.
3. A clear specification type and scope declared before production begins.

## Specification Types (Initial Taxonomy)

- **Teleological manual:** Prescribes which surface(s) to deploy for which institutional purposes, under what conditions, with what tradeoffs. Scope: one modality class.
- **Adapter contract:** Prescribes how two or more surfaces should integrate, what data flows between them, and what governance applies at the boundary. Scope: surface pair or triad.
- **Governance protocol:** Prescribes how to prevent the structural entropy documented in the layer scaffold's failure-mode primitives. Scope: one modality class or one surface.

## Production Procedure

1. Declare the specification type and scope.
2. Identify the upstream descriptive substrate (which scaffolds and which primitives are being consumed).
3. Extract the prescriptive content: derive institutional recommendations from the structural analysis in the scaffolds. Every prescription must trace to at least one identified primitive or synthesis observation in an accepted scaffold.
4. Apply the following validation criteria:
   - **Upstream traceability:** Every prescription cites the scaffold primitive(s) or synthesis observation(s) it derives from.
   - **Actionability:** Every prescription is specific enough that an operator could act on it without further interpretation.
   - **Scope boundary:** The specification does not prescribe beyond its declared scope.
   - **Descriptive-prescriptive boundary:** The specification does not re-describe what the scaffolds already describe — it prescribes behavior based on that description.
   - **Falsifiability:** Each prescription could in principle be wrong and could be tested against operational experience.
5. Self-audit against these criteria. Surface any prescription that fails traceability or actionability.

## Method Level Advancement

- Level 0 → tested-once: First successful invocation with output passing validation.
- Level 1 → curated: Operator review confirms output quality.
- Level 2 → operational: Multiple diverse invocations across specification types.

---

*This draft procedure is sufficient to execute the first specification-production invocation. It is not a grammar-layer amendment. It does not modify METHOD-ENGINE.md. It is a governed working document that may be refined, promoted, or superseded based on operational experience.*
