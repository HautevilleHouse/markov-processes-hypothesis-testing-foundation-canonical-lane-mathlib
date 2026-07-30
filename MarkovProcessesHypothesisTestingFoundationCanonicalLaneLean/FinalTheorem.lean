import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean.LikelihoodRatioTest

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean

def ConstrainedHypothesisTestingClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_hypothesis_testing_endgame (A : AdmissibleClass) :
    ConstrainedHypothesisTestingClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean
end HautevilleHouse