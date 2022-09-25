using UnityEngine;

namespace _Game.Scripts.Gameplay
{
    public class WidgetGrader : MonoBehaviour
    {
        [SerializeField] private bool _expectSanitization;
        [SerializeField] private bool _expectFill;
        [SerializeField] private bool _expectDropper;

        [SerializeField] private GameObject _testParent;

        void Start()
        {
            Debug.Log($"Is Parent? {transform.IsChildOf(_testParent.transform)}");
            Debug.Log($"{transform.root.name}");
        }
        
        public bool GradeWidget(GameObject widget)
        {
            var widgetState = widget.GetComponent<WidgetStateData>();
            if (_expectSanitization && !widgetState.IsSanitized) return false;
            if (_expectFill && !widgetState.IsFilled) return false;
            if (_expectDropper && !widgetState.IsDosed) return false;
            return true;
        }
    }
}