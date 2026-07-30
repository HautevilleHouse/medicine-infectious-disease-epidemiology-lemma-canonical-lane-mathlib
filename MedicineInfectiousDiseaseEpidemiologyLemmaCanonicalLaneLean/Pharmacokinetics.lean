import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineInfectiousDiseaseEpidemiologyLemmaCanonicalLaneLean

structure PharmacokineticPackage where
  drugConcentration : Type u
  absorptionRate : Prop
  eliminationRate : Prop
  volumeOfDistribution : Prop
  halfLife : Prop

structure PharmacokineticEvidence (P : PharmacokineticPackage) where
  absorptionRateClosed : P.absorptionRate
  eliminationRateClosed : P.eliminationRate
  volumeOfDistributionClosed : P.volumeOfDistribution
  halfLifeClosed : P.halfLife

def PharmacokineticClosed (P : PharmacokineticPackage) : Prop :=
  P.absorptionRate ∧ P.eliminationRate ∧ P.volumeOfDistribution ∧ P.halfLife

theorem pharmacokinetic_closed_from_evidence (P : PharmacokineticPackage) (E : PharmacokineticEvidence P) :
    PharmacokineticClosed P := by
  exact And.intro E.absorptionRateClosed (And.intro E.eliminationRateClosed (And.intro E.volumeOfDistributionClosed E.halfLifeClosed))

end MedicineInfectiousDiseaseEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse