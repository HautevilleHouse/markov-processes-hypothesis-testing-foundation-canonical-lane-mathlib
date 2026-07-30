import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean

structure MarkovTheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  markovConstrainedStatement : String
  certificateLane : String
  carriedRemainder : String
deriving Repr, DecidableEq

def markovSourceTheoremStatement : MarkovTheoremStatement := {
  sourceKey := "MarkovProcessesHypothesisTestingFoundation",
  theoremName := "Markov Hypothesis Testing Endgame",
  theoremObject := "MarkovAdmittedObject",
  classicalBoundary := "open",
  markovConstrainedStatement := "constrained Markov hypothesis theorem certificate",
  certificateLane := "markov_constrained",
  carriedRemainder := "unrestricted classical closure"
}

end MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean
end HautevilleHouse