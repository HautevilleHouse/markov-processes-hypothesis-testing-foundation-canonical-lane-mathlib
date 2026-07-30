import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean.MarkovChainHypothesisTesting

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean

structure BayesFactor (X : Type) [Fintype X] where
  priorOdds : ℝ
  posteriorOdds : ℝ
  bayesFactor : ℝ
  interpretation : String -- "strong evidence", "moderate evidence", "weak evidence"

structure BayesianHypothesisTest {X : Type} [Fintype X] (h : MarkovChainHypothesis X) where
  priorDistribution : X → ℝ
  posteriorDistribution : X → ℝ
  bayesFactor : BayesFactor X
  decision : String

def bayesianTestClosed {X : Type} [Fintype X] {h : MarkovChainHypothesis X} (b : BayesianHypothesisTest h) : Prop :=
  b.bayesFactor.bayesFactor > 0

end MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean
end HautevilleHouse