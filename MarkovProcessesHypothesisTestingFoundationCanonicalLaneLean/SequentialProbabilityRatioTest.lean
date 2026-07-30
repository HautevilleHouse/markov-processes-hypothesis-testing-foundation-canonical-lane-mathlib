import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean.MarkovChainHypothesisTesting

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean

structure SequentialProbabilityRatioTest (X : Type) [Fintype X] where
  nullHypothesis : MarkovChainHypothesis X
  alternativeHypothesis : MarkovChainHypothesis X
  upperBound : ℝ
  lowerBound : ℝ
  stoppingTime : ℕ
  decision : String -- "accept null", "reject null", "continue"

def sprTestClosed {X : Type} [Fintype X] (s : SequentialProbabilityRatioTest X) : Prop :=
  s.upperBound > 0 ∧ s.lowerBound > 0 ∧ s.upperBound ≥ s.lowerBound

end MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean
end HautevilleHouse