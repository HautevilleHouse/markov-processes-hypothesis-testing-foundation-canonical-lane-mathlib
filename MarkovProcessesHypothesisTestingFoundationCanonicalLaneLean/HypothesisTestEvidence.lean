import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean.MarkovChainHypothesisTesting

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean

structure HypothesisTestEvidence {X : Type} [Fintype X] (h : MarkovChainHypothesis X) where
  pValue : ℝ
  testStatisticValue : ℝ
  criticalValue : ℝ
  rejected : Bool
  evidenceConsistent : Prop

def evidenceClosed {X : Type} [Fintype X] {h : MarkovChainHypothesis X} (e : HypothesisTestEvidence h) : Prop :=
  e.pValue > 0 ∧ e.pValue ≤ 1

end MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean
end HautevilleHouse