using UnityEngine;

namespace _Game.Scripts.Gameplay
{
    public class WidgetStateData : MonoBehaviour
    {
        private bool _isFilled = false;
        private bool _isDosed = false;
        private bool _isSanitized = false;
        
        public bool IsFilled => FillPercent >= 1;
        public bool IsDosed => _isDosed;
        public bool IsSanitized => _isSanitized;
        public float FillPercent { get; set; }
    }
}