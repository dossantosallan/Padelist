class_name ActionResolver
extends RefCounted
## Resolves a ClinicalAction applied to a Patient. Pure logic, no scene.
## Implements design/game-brief.md MVP feature 3 (story-002).
## Time and staff costs are only exposed on the action; story 004 spends them.

enum Result { INDICATED, NOT_INDICATED, REJECTED_DEAD }


## Applies [param action] to [param patient].
## Indicated: the patient recovers on later ticks and a later death is not avoidable.
## Not indicated: no improvement; the action's penalty (default 0) hits the vitals now.
## Dead patient: rejected, nothing changes.
static func apply_action(patient: Patient, action: ClinicalAction) -> Result:
	if patient.state == Patient.State.DEAD:
		return Result.REJECTED_DEAD
	if action.treats(patient.condition_id):
		patient.receive_indicated_action()
		return Result.INDICATED
	patient.pa -= action.penalty_pa
	patient.fc += action.penalty_fc
	patient.spo2 -= action.penalty_spo2
	patient.consciousness -= action.penalty_consciousness
	return Result.NOT_INDICATED
