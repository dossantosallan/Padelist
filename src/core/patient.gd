class_name Patient
extends RefCounted
## Patient data: 4 simplified vitals, derived state, clinical picture.
## Implements design/game-brief.md MVP feature 4 (story-001).

enum State { STABLE, UNSTABLE, CRITICAL, DEAD }

var pa: int
var fc: int
var spo2: int
var consciousness: int
var state: State = State.STABLE
## Clinical picture id; keys the per-condition rates in PatientRules.
var condition_id: StringName
## True once the indicated action was received.
var indicated_action_received: bool = false
## True if the patient died without receiving the indicated action.
var avoidable_death: bool = false


func _init(p_condition_id: StringName, p_pa: int, p_fc: int, p_spo2: int, p_consciousness: int) -> void:
	condition_id = p_condition_id
	pa = p_pa
	fc = p_fc
	spo2 = p_spo2
	consciousness = p_consciousness


## Called by clinical actions (story 002) when the indicated action is given.
func receive_indicated_action() -> void:
	indicated_action_received = true
