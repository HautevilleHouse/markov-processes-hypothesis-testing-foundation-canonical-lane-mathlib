import MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean.StochasticProcess

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean

structure HypothesisTestingPackage where
  nullHypothesis : Prop
  alternativeHypothesis : Prop
  testStatistic : Type u
  criticalRegion : set (testStatistic)
  significanceLevel : ℝ
  powerFunction : (testStatistic) → ℝ

def HypothesisTestingClosed (H : HypothesisTestingPackage) : Prop :=
  H.nullHypothesis ∧ H.alternativeHypothesis ∧ H.significanceLevel > 0

end MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean
end HautevilleHouse