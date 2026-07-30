import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean

structure MarkovStateSpace where
  point : Type u
  sigmaAlgebra : Set (Set point)
  probabilityMeasure : point → ℝ
  transitionKernel : point → Set point → ℝ
  markovProperty : Prop
  initialDistributionDefined : Prop
  pointTerm : point
  sigmaAlgebraTerm : sigmaAlgebra
  probabilityMeasureTerm : probabilityMeasure
  transitionKernelTerm : transitionKernel
  markovPropertyTerm : markovProperty
  initialDistributionDefinedTerm : initialDistributionDefined

structure MarkovStateSpaceEvidence (M : MarkovStateSpace) where
  markovPropertyClosed : M.markovProperty
  initialDistributionDefinedClosed : M.initialDistributionDefined

def MarkovStateSpaceClosed (M : MarkovStateSpace) : Prop :=
  M.markovProperty ∧ M.initialDistributionDefined

theorem markov_state_space_closed_from_evidence
    (M : MarkovStateSpace) (E : MarkovStateSpaceEvidence M) :
    MarkovStateSpaceClosed M := by
  exact And.intro E.markovPropertyClosed E.initialDistributionDefinedClosed

end MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean
end HautevilleHouse