import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean

structure MartingaleCentralLimitTheorem where
  martingaleDifferenceSequence : Prop
  conditionalVariance : Prop
  lindebergCondition : Prop
  asymptoticNormality : Prop
  rateOfConvergence : Prop

structure MartingaleCentralLimitTheoremEvidence (M : MartingaleCentralLimitTheorem) where
  martingaleDifferenceSequenceClosed : M.martingaleDifferenceSequence
  conditionalVarianceClosed : M.conditionalVariance
  lindebergConditionClosed : M.lindebergCondition
  asymptoticNormalityClosed : M.asymptoticNormality
  rateOfConvergenceClosed : M.rateOfConvergence

def MartingaleCentralLimitTheoremClosed (M : MartingaleCentralLimitTheorem) : Prop :=
  M.martingaleDifferenceSequence ∧ M.conditionalVariance ∧ M.lindebergCondition ∧
  M.asymptoticNormality ∧ M.rateOfConvergence

theorem martingale_central_limit_theorem_closed_from_evidence (M : MartingaleCentralLimitTheorem) (E : MartingaleCentralLimitTheoremEvidence M) : MartingaleCentralLimitTheoremClosed M := by
  exact And.intro E.martingaleDifferenceSequenceClosed
    (And.intro E.conditionalVarianceClosed
      (And.intro E.lindebergConditionClosed
        (And.intro E.asymptoticNormalityClosed E.rateOfConvergenceClosed)))

end MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean
end HautevilleHouse