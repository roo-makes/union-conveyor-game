using UnityEngine;
using UnityEngine.Events;
using UnityEngine.SceneManagement;

namespace _Game.Scripts.Gameplay
{
    public class GameOverManager : MonoBehaviour
    {
        [SerializeField] private UnityEvent _onGameOver;
        [SerializeField] private int _numFailuresAllowed;

        public void PlayerFailedWidgets(int numFailed)
        {
            if (numFailed >= _numFailuresAllowed)
            {
                _onGameOver.Invoke();
            }
        }

        public void RestartScene()
        {
            SceneManager.LoadScene(SceneManager.GetActiveScene().name);
        }
    }
}