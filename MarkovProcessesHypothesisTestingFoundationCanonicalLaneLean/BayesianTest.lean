import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean

structure BayesianTestPackage where
  priorDistribution : Type u
  posteriorDistribution : Type u
  lossFunction : Type u → ℝ
  decisionRule : Type u
  expectedLoss : ℝ
  priorDefined : Prop
  posteriorDefined : Prop
  lossFunctionDefined : Prop
  decisionRuleDefined : Prop
  expectedLossFinite : expectedLoss ≠ ∞

def BayesianTestClosed (B : BayesianTestPackage) : Prop :=
  B.priorDefined ∧ B.posteriorDefined ∧ B.lossFunctionDefined ∧ B.decisionRuleDefined

structure BayesianTestEvidence (B : BayesianTestPackage) where
  priorDefinedClosed : B.priorDefined
  posteriorDefinedClosed : B.posteriorDefined
  lossFunctionDefinedClosed : B.lossFunctionDefined
  decisionRuleDefinedClosed : B.decisionRuleDefined

theorem bayesian_test_closed_from_evidence
    (B : BayesianTestPackage) (E : BayesianTestEvidence B) :
    BayesianTestClosed B := by
  exact And.intro E.priorDefinedClosed
    (And.intro E.posteriorDefinedClosed
      (And.intro E.lossFunctionDefinedClosed E.decisionRuleDefinedClosed))

end MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean
end HautevilleHouse