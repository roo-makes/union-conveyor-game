using UnityEngine;
using UnityEngine.SceneManagement;

namespace _Game.Scripts.Gameplay
{
    public class NextLevelManager : MonoBehaviour
    {
        [SerializeField] private string _nextSceneName;
        
        public void LoadNextScene()
        {
            SceneManager.LoadScene(_nextSceneName);
        }
    }
}