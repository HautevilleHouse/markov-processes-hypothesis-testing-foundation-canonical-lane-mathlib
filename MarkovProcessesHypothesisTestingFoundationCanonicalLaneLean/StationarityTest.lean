import MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean.HypothesisTestingPackage

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean

structure StationarityTest extends HypothesisTestingPackage where
  unitRootCondition : Prop
  timeSeriesLength : ℕ
  testCriticalValues : ℕ → ℝ → ℝ

def StationarityTestClosed (S : StationarityTest) : Prop :=
  S.unitRootCondition ∧ HypothesisTestingClosed S.toHypothesisTestingPackage

end MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean
end HautevilleHouse