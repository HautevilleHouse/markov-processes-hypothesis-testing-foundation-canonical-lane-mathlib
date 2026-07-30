import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean

structure MarkovSwitchingAutoregressive where
  regimeProcess : Prop
  autoregressiveCoefficients : Prop
  regimeTransitionProbabilities : Prop
  stationarityCondition : Prop
  estimationConsistency : Prop

structure MarkovSwitchingAutoregressiveEvidence (M : MarkovSwitchingAutoregressive) where
  regimeProcessClosed : M.regimeProcess
  autoregressiveCoefficientsClosed : M.autoregressiveCoefficients
  regimeTransitionProbabilitiesClosed : M.regimeTransitionProbabilities
  stationarityConditionClosed : M.stationarityCondition
  estimationConsistencyClosed : M.estimationConsistency

def MarkovSwitchingAutoregressiveClosed (M : MarkovSwitchingAutoregressive) : Prop :=
  M.regimeProcess ∧ M.autoregressiveCoefficients ∧ M.regimeTransitionProbabilities ∧
  M.stationarityCondition ∧ M.estimationConsistency

theorem markov_switching_autoregressive_closed_from_evidence (M : MarkovSwitchingAutoregressive) (E : MarkovSwitchingAutoregressiveEvidence M) : MarkovSwitchingAutoregressiveClosed M := by
  exact And.intro E.regimeProcessClosed
    (And.intro E.autoregressiveCoefficientsClosed
      (And.intro E.regimeTransitionProbabilitiesClosed
        (And.intro E.stationarityConditionClosed E.estimationConsistencyClosed)))

end MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean
end HautevilleHouse