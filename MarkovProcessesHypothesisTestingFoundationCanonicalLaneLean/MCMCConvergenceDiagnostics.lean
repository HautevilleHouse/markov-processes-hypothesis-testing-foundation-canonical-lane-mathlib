import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean.MarkovChainHypothesisTesting

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean

structure MCMCSample (X : Type) where
  chainLength : ℕ
  samples : X → ℕ
  autocorrelation : ℝ
  effectiveSampleSize : ℝ

structure ConvergenceDiagnostics (X : Type) where
  gelmanRubinStatistic : ℝ
  gewekeStatistic : ℝ
  heidelbergerWelch : Bool
  rafteryLewis : Prop

def convergenceDiagnosticsClosed {X : Type} (d : ConvergenceDiagnostics X) : Prop :=
  d.gelmanRubinStatistic < 1.1 ∧ d.heidelbergerWelch = true

end MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean
end HautevilleHouse