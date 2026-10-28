class_name ClinicalAction
extends Resource
## One clinical action, defined as data (one .tres per action).
## Implements design/game-brief.md MVP feature 3 (story-002).

## Stable id, e.g. &"o2_iot".
@export var id: StringName
## Name shown to the player (Portuguese).
@export var display_name: String
## Shift time consumed, in game minutes (consumed by story 004).
@export var time_cost_minutes: int
## Staff exhaustion added, in percentage points (consumed by story 004).
@export var staff_cost: int
## Condition ids (Patient.condition_id) for which this action is indicated.
@export var treats_conditions: Array[StringName] = []

@export_group("Non-indicated penalty")
## Applied once to the vitals when given to a patient it does not treat.
## PA, SpO2 and consciousness drop by these; FC rises. 0 = no penalty.
@export var penalty_pa: int = 0
@export var penalty_fc: int = 0
@export var penalty_spo2: int = 0
@export var penalty_consciousness: int = 0


## True if this action is indicated for [param condition_id].
func treats(condition_id: StringName) -> bool:
	return treats_conditions.has(condition_id)
