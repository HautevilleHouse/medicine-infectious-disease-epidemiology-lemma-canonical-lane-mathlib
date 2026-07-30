import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineInfectiousDiseaseEpidemiologyLemmaCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  compartmentConstrainedStatement : String
  certificateLane : String
  carriedRemainder : String

def sourceRepository : String := "medicine-infectious-disease-epidemiology-lemma-canonical-lane"
def sourceDescription : String := "Infectious disease epidemiology lemma: endemic equilibrium existence under SIR model with positive transmission and recovery rates."
def baselineCertificateLane : String := "compartment_constrained"

def sourceTheoremStatement : TheoremStatement := {
  sourceKey := sourceRepository
  theoremName := sourceRepository
  theoremObject := sourceDescription
  classicalBoundary := "unrestricted classical boundary remains carried"
  compartmentConstrainedStatement := "compartment-constrained theorem certificate internalized through SIR model bridge"
  certificateLane := baselineCertificateLane
  carriedRemainder := "classical source boundary carried by the formalization's open boundary flag"
}

end MedicineInfectiousDiseaseEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse