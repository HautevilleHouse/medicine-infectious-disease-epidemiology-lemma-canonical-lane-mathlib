import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineInfectiousDiseaseEpidemiologyLemmaCanonicalLaneLean

structure PharmacokineticPackage where
  drugConcentration : Type u
  dose : Float
  volumeOfDistribution : Float
  eliminationRate : Float
  halfLife : Float
  bioavailability : Float

structure PharmacokineticEvidence (P : PharmacokineticPackage) where
  drugConcentrationClosed : P.drugConcentration
  doseClosed : P.dose > 0
  volumeOfDistributionClosed : P.volumeOfDistribution > 0
  eliminationRateClosed : P.eliminationRate > 0
  halfLifeClosed : P.halfLife > 0
  bioavailabilityClosed : P.bioavailability ≥ 0 ∧ P.bioavailability ≤ 1

def PharmacokineticClosed (P : PharmacokineticPackage) : Prop :=
  P.dose > 0 ∧ P.volumeOfDistribution > 0 ∧ P.eliminationRate > 0 ∧
  P.halfLife > 0 ∧ P.bioavailability ≥ 0 ∧ P.bioavailability ≤ 1

theorem pharmacokinetic_closed_from_evidence (P : PharmacokineticPackage)
    (E : PharmacokineticEvidence P) : PharmacokineticClosed P := by
  exact And.intro E.doseClosed
    (And.intro E.volumeOfDistributionClosed
      (And.intro E.eliminationRateClosed
        (And.intro E.halfLifeClosed
          (And.intro E.bioavailabilityClosed.1 E.bioavailabilityClosed.2))))

end MedicineInfectiousDiseaseEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse
