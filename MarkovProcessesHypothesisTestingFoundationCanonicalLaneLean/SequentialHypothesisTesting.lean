import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean

structure SequentialHypothesisTesting where
  stoppingTime : Prop
  sequentialLikelihoodRatio : Prop
  averageSampleSize : Prop
  optimalStoppingBoundary : Prop
  waldInequality : Prop

structure SequentialHypothesisTestingEvidence (S : SequentialHypothesisTesting) where
  stoppingTimeClosed : S.stoppingTime
  sequentialLikelihoodRatioClosed : S.sequentialLikelihoodRatio
  averageSampleSizeClosed : S.averageSampleSize
  optimalStoppingBoundaryClosed : S.optimalStoppingBoundary
  waldInequalityClosed : S.waldInequality

def SequentialHypothesisTestingClosed (S : SequentialHypothesisTesting) : Prop :=
  S.stoppingTime ∧ S.sequentialLikelihoodRatio ∧ S.averageSampleSize ∧
  S.optimalStoppingBoundary ∧ S.waldInequality

theorem sequential_hypothesis_testing_closed_from_evidence (S : SequentialHypothesisTesting) (E : SequentialHypothesisTestingEvidence S) : SequentialHypothesisTestingClosed S := by
  exact And.intro E.stoppingTimeClosed
    (And.intro E.sequentialLikelihoodRatioClosed
      (And.intro E.averageSampleSizeClosed
        (And.intro E.optimalStoppingBoundaryClosed E.waldInequalityClosed)))

end MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean
end HautevilleHouse