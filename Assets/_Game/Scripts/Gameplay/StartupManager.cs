using _Framework;
using UnityEngine;

namespace _Game.Scripts.Gameplay
{
    public class StartupManager : MonoBehaviour
    {
        [SerializeField] private FloatVariable _conveyorSpeed;
        [SerializeField] private BoolVariable _conveyorsActive;
        [SerializeField] private BoolVariable _widgetSpawningActive;
        
        void Start()
        {
            _conveyorSpeed.Value = 0;
            _conveyorsActive.Value = false;
            _widgetSpawningActive.Value = false;
        }
    }
}