import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean

structure SequentialTestPackage where
  stoppingTime : ℕ → Prop
  decisionRule : ℕ → Prop
  errorProbabilities : ℝ × ℝ
  averageSampleSize : ℕ
  stoppingTimeDefined : Prop
  decisionRuleDefined : Prop
  errorProbabilitiesDefined : Prop
  averageSampleSizeDefined : Prop
  errorProbabilitiesInUnitInterval : 0 ≤ errorProbabilities.1 ∧ errorProbabilities.1 ≤ 1 ∧ 0 ≤ errorProbabilities.2 ∧ errorProbabilities.2 ≤ 1
  averageSampleSizeFinite : averageSampleSize ≠ ∞

structure SequentialTestEvidence (S : SequentialTestPackage) where
  stoppingTimeDefinedClosed : S.stoppingTimeDefined
  decisionRuleDefinedClosed : S.decisionRuleDefined
  errorProbabilitiesDefinedClosed : S.errorProbabilitiesDefined
  averageSampleSizeDefinedClosed : S.averageSampleSizeDefined

def SequentialTestClosed (S : SequentialTestPackage) : Prop :=
  S.stoppingTimeDefined ∧ S.decisionRuleDefined ∧
  S.errorProbabilitiesDefined ∧ S.averageSampleSizeDefined

theorem sequential_test_closed_from_evidence
    (S : SequentialTestPackage) (E : SequentialTestEvidence S) :
    SequentialTestClosed S := by
  exact And.intro E.stoppingTimeDefinedClosed
    (And.intro E.decisionRuleDefinedClosed
      (And.intro E.errorProbabilitiesDefinedClosed E.averageSampleSizeDefinedClosed))

end MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean
end HautevilleHouse