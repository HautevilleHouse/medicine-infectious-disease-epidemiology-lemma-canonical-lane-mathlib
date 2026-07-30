import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineInfectiousDiseaseEpidemiologyLemmaCanonicalLaneLean

structure PharmacokineticModel where
  dose : ℝ
  volumeDistribution : ℝ
  eliminationRate : ℝ
  drugConcentration : ℝ → ℝ
  therapeuticWindowLower : ℝ
  therapeuticWindowUpper : ℝ

structure PharmacokineticModelEvidence (P : PharmacokineticModel) where
  dosePos : P.dose > 0
  volumeDistributionPos : P.volumeDistribution > 0
  eliminationRatePos : P.eliminationRate > 0
  concentrationInWindow : ∀ t, P.therapeuticWindowLower ≤ P.drugConcentration t ∧ P.drugConcentration t ≤ P.therapeuticWindowUpper

def PharmacokineticModelClosed (P : PharmacokineticModel) : Prop :=
  P.dose > 0 ∧ P.volumeDistribution > 0 ∧ P.eliminationRate > 0 ∧
  (∀ t, P.therapeuticWindowLower ≤ P.drugConcentration t ∧ P.drugConcentration t ≤ P.therapeuticWindowUpper)

theorem pharmacokinetic_model_closed_from_evidence (P : PharmacokineticModel) (E : PharmacokineticModelEvidence P) :
    PharmacokineticModelClosed P := by
  exact And.intro E.dosePos (And.intro E.volumeDistributionPos (And.intro E.eliminationRatePos E.concentrationInWindow))

end MedicineInfectiousDiseaseEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse