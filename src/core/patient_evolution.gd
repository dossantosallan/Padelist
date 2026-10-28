class_name PatientEvolution
extends RefCounted
## Applies one game-hour of evolution to a Patient using PatientRules.
## Deterministic for the same patient, rules and seeded RNG.

var _rules: PatientRules


func _init(rules: PatientRules) -> void:
	_rules = rules


## Advances [param patient] by one tick. Dead patients are left unchanged.
func tick(patient: Patient, rng: RandomNumberGenerator) -> void:
	if patient.state == Patient.State.DEAD:
		return
	if patient.state == Patient.State.STABLE:
		patient.pa = patient.pa + rng.randi_range(-_rules.stable_noise_pa, _rules.stable_noise_pa)
		patient.fc = patient.fc + rng.randi_range(-_rules.stable_noise_fc, _rules.stable_noise_fc)
		patient.spo2 = patient.spo2 + rng.randi_range(-_rules.stable_noise_spo2, _rules.stable_noise_spo2)
	elif patient.indicated_action_received:
		patient.pa = mini(patient.pa + _rules.improve_pa, _rules.baseline_pa)
		patient.fc = maxi(patient.fc - _rules.improve_fc, _rules.baseline_fc)
		patient.spo2 = mini(patient.spo2 + _rules.improve_spo2, _rules.baseline_spo2)
		patient.consciousness = mini(patient.consciousness + _rules.improve_consciousness, _rules.baseline_consciousness)
	else:
		var mult: float = _rules.condition_worsen_multipliers.get(patient.condition_id, _rules.default_worsen_multiplier)
		patient.pa -= _worsen(_rules.worsen_pa, mult, rng)
		patient.fc += _worsen(_rules.worsen_fc, mult, rng)
		patient.spo2 -= _worsen(_rules.worsen_spo2, mult, rng)
		patient.consciousness -= _worsen(_rules.worsen_consciousness, mult, rng)
	patient.state = derive_state(patient)
	if patient.state == Patient.State.DEAD and not patient.indicated_action_received:
		patient.avoidable_death = true


## Derives the state from the vitals using the rule thresholds.
func derive_state(patient: Patient) -> Patient.State:
	if patient.pa <= _rules.pa_dead_at_or_below \
			or patient.spo2 <= _rules.spo2_dead_at_or_below \
			or patient.consciousness <= _rules.consciousness_dead_at_or_below:
		return Patient.State.DEAD
	if patient.pa <= _rules.pa_critical_at_or_below \
			or patient.fc >= _rules.fc_critical_at_or_above \
			or patient.spo2 <= _rules.spo2_critical_at_or_below \
			or patient.consciousness <= _rules.consciousness_critical_at_or_below:
		return Patient.State.CRITICAL
	if patient.pa <= _rules.pa_unstable_at_or_below \
			or patient.fc >= _rules.fc_unstable_at_or_above \
			or patient.spo2 <= _rules.spo2_unstable_at_or_below \
			or patient.consciousness <= _rules.consciousness_unstable_at_or_below:
		return Patient.State.UNSTABLE
	return Patient.State.STABLE


func _worsen(rate: int, mult: float, rng: RandomNumberGenerator) -> int:
	return roundi((rate + rng.randi_range(0, _rules.worsen_jitter)) * mult)

