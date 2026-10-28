class_name PatientRules
extends Resource
## Tunable thresholds and rates for patient evolution.
## Implements design/game-brief.md MVP feature 4 (story-001).

@export_group("State thresholds")
## Systolic BP (mmHg): at or below -> UNSTABLE / CRITICAL / DEAD.
@export var pa_unstable_at_or_below: int
@export var pa_critical_at_or_below: int
@export var pa_dead_at_or_below: int
## Heart rate (bpm): at or above -> UNSTABLE / CRITICAL.
@export var fc_unstable_at_or_above: int
@export var fc_critical_at_or_above: int
## SpO2 (%): at or below -> UNSTABLE / CRITICAL / DEAD.
@export var spo2_unstable_at_or_below: int
@export var spo2_critical_at_or_below: int
@export var spo2_dead_at_or_below: int
## Consciousness (3-15 scale): at or below -> UNSTABLE / CRITICAL / DEAD.
@export var consciousness_unstable_at_or_below: int
@export var consciousness_critical_at_or_below: int
@export var consciousness_dead_at_or_below: int

@export_group("Per-tick rates")
## Max random drift per vital per tick while STABLE (applied as +/-).
@export var stable_noise_pa: int
@export var stable_noise_fc: int
@export var stable_noise_spo2: int
## Base worsening per tick while not stable and no indicated action received.
@export var worsen_pa: int
@export var worsen_fc: int
@export var worsen_spo2: int
@export var worsen_consciousness: int
## Extra random worsening, 0..jitter, added to each worsen rate.
@export var worsen_jitter: int
## Improvement per tick once the indicated action was received.
@export var improve_pa: int
@export var improve_fc: int
@export var improve_spo2: int
@export var improve_consciousness: int

@export_group("Clinical pictures")
## condition_id (StringName) -> worsening multiplier. Missing id => default.
@export var condition_worsen_multipliers: Dictionary = {}
@export var default_worsen_multiplier: float

@export_group("Healthy baseline")
## Values at which vitals stop improving (and the cap for noise).
@export var baseline_pa: int
@export var baseline_fc: int
@export var baseline_spo2: int
@export var baseline_consciousness: int
